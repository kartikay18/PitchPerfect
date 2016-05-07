//
//  RecordSoundsViewController.swift
//  firsapp
//
//  Created by Vibhu Goyle on 04/05/16.
//  Copyright © 2016 Vibhu Goyle. All rights reserved.
//

import UIKit
import AVFoundation
class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var labelrecord: UILabel!
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("twta")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        print("Button Pressed")
        labelrecord.text="Recording"
        recordButton.enabled=false
        stopRecordingButton.enabled=true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0]
            as String
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

    @IBOutlet weak var recordButton: UIButton!
    @IBAction func stoprecord(sender: AnyObject) {
        print("Stop Recording Button Pressed")
        recordButton.enabled=true
        stopRecordingButton.enabled=false
        labelrecord.text="Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    @IBAction func recordingStop(sender: AnyObject) {
        

    }
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled=false;
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudioRecorder finished saving recording")
        if(flag){
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }
        else{
        
        print("Saving of Recording Failed")
        }
    }
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}