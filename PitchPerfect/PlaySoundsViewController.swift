//
//  PlaySoundsViewController.swift
//  firsapp
//
//  Created by Vibhu Goyle on 07/05/16.
//  Copyright © 2016 Vibhu Goyle. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    //var recordedAudioURL: NSURL!

    @IBOutlet weak var ChipmunkButton: UIButton!
    
    @IBOutlet weak var ParrotButton: UIButton!
    
    @IBOutlet weak var DarthVaderButton: UIButton!
    
    @IBOutlet weak var SnailButton: UIButton!
    
    
    @IBOutlet weak var ReverbButton: UIButton!
    
    
    @IBOutlet weak var FastButton: UIButton!
    
    @IBOutlet weak var StopButton: UIButton!
    
    @IBAction func playSoundForButton(sender: UIButton){
        print("Play Sound Button Pressed")
        switch(ButtonType(rawValue: sender.tag)!)
        {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case.Chipmunk:
            playSound(pitch: 1000)
        case.Vader:
            playSound(pitch: -1000)
        case.Echo:
            playSound(echo: true)
        case.Reverb:
            playSound(reverb: true)
        }
        configureUI(.Playing)
    }
    @IBAction func stopButtonPressed(sender: AnyObject){
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
