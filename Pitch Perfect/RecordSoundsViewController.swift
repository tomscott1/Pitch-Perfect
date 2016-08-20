//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Tom Scott on 15/08/2016.
//  Copyright © 2016 Tom Scott. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLable: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        recordingLable.text = "Recording in progress"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(sender: AnyObject) {
        stopRecordingButton.enabled = false
        recordButton.enabled = true
        recordingLable.text = "Tap to record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    @IBOutlet weak var recordButton: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingButton: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("audio recorded")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        } else {
            print("audio recording failed")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
}

