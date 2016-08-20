//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Tom Scott on 16/08/2016.
//  Copyright © 2016 Tom Scott. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    
    @IBOutlet weak var SnailButton: UIButton!
    @IBOutlet weak var RabbitButton: UIButton!
    @IBOutlet weak var ChipmunkButton: UIButton!
    @IBOutlet weak var DarthVaderButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow=0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("play sound for button pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("stop button pressed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
//    }
    
    //delete below if used elsewhere
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
