//
//  ViewController.swift
//  Recorder
//
//  Created by Christoper on 21/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordButton: RoundedUIButon!
    @IBOutlet weak var playRecordButton: RoundedUIButon!
    @IBOutlet weak var playedTime: UILabel!
    
    var soundRecorder = AVAudioRecorder()
    var soundPlayer = AVAudioPlayer()

    var isPlaying = false
    var filename = "audioFile.m4a"
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        setupButtonStyle()
        // Do any additional setup after loading the view.
    }
    
    func setupButtonStyle () {
        recordButton.rounded()
        playRecordButton.rounded()
    }
    
    func setupRecorder() {
        let recordSettings = [ AVFormatIDKey: kAudioFormatAppleLossless,
                               AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
                               AVEncoderBitRateKey: 320000,
                               AVNumberOfChannelsKey: 2,
                               AVSampleRateKey: 44100.0 ] as [String : Any]
        
        var error: NSError?
        do {
            soundRecorder = try AVAudioRecorder(url: getFileURL(), settings: recordSettings as [String: AnyObject])
            
            if error != nil {
                NSLog("Something wrong")
            } else {
                soundRecorder.delegate = self
                soundRecorder.prepareToRecord()
            }
            
        } catch let error1 as NSError{
            error = error1
            soundRecorder = AVAudioRecorder()
            print("error \(String(describing: error))")
        }
        
    }
    
    func getCacheDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0]
    }
    
    func getFileURL() -> URL{
        let documentsURL = URL(fileURLWithPath: getCacheDirectory())
        let path = documentsURL.appendingPathComponent(filename)
        return path
    }
    
    @IBAction func recordAudio(_ sender: RoundedUIButon) {
        if "Record" == sender.titleLabel?.text {
            recordActive()
        } else {
            recordDeActive()
        }
    }
    
    func recordDeActive () {
        soundRecorder.stop()
        timer?.invalidate()
        playedTime.textColor = .white
        recordButton.setTitle("Record", for: .normal)
        recordButton.bgNormal()
        playRecordButton.enabledBtn()
        playRecordButton.bgNormal()
    }
    
    func recordActive () {
        soundRecorder.record()
        recordButton.setTitle("Stop", for: .normal)
        recordButton.bgActive()
        playRecordButton.disabledBtn()
        playedTime.textColor = .vermilion
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeRecording), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimeRecording() {
        let currentTime = Int(soundRecorder.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        print("currentTime \(currentTime) \(minutes) \(seconds) \(soundPlayer.currentTime)")
            
        playedTime.text = String(format: "%02d:%02d", minutes,seconds) as String
        
//        if soundPlayer.currentTime <= 0 {
//            print("Timeout")
//            recordDeActive()
//        }
    }
    
    @IBAction func playRecordAudio(_ sender: RoundedUIButon) {
        if "Play Record" == sender.titleLabel?.text {
            playRecordActive()
        } else {
            playRecordDeActive()
        }
    }
    
    func playRecordDeActive() {
        soundPlayer.stop()
        playRecordButton.setTitle("Play Record", for: .normal)
        playRecordButton.bgNormal()
        recordButton.enabledBtn()
        recordButton.bgNormal()
        soundPlayer.stop()
        timer?.invalidate()
    }
    func playRecordActive() {
        preparePlayer()
        recordButton.disabledBtn()
        playRecordButton.bgNormal()
        playRecordButton.setTitle("Stop", for: .normal)
        isPlaying = true
        playedTime.text = String(format: "%02d:%02d", 0,0) as String
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimePlayback), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimePlayback() {
        let currentTime = Int(soundPlayer.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        print("currentTime \(currentTime) \(minutes) \(seconds) \(soundPlayer.currentTime)")
            
        playedTime.text = String(format: "%02d:%02d", minutes,seconds) as String
        
        if soundPlayer.currentTime <= 0 {
            print("Timeout")
            playRecordDeActive()
        }
    }
    
    func preparePlayer() {
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: getFileURL())
            soundPlayer.volume = 1.0
            soundPlayer.play()
        } catch let error as NSError {
            print("Player error: \(error)")
        }
    }
}
