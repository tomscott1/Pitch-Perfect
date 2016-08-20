//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Tom Scott on 16/08/2016.
//  Copyright © 2016 Tom Scott. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    
    
    @IBOutlet weak var SnailButton: UIButton!
    @IBOutlet weak var RabbitButton: UIButton!
    @IBOutlet weak var ChipmunkButton: UIButton!
    @IBOutlet weak var DarthVaderButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("play sound for button pressed")
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("stop button pressed")
    }
    
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var StopTimer: NSTimer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
