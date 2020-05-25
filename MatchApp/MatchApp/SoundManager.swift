//
//  SoundManager.swift
//  MatchApp
//
//  Created by Christoper on 20/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case noMatch
    }
    
    static func playSound(_ effect:SoundEffect) {
        var soundFileName = ""
        
        // Determine which sound effect we want play
        // And set the appropiate filename
        switch effect {
        case .flip:
            soundFileName = "cardflip"
        case .match:
            soundFileName = "dingcorrect"
        case .noMatch:
            soundFileName = "dingwrong"
        case .shuffle:
            soundFileName = "shuffle"
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard nil != bundlePath else {
            print("Couldn't find sound file \(soundFileName) in the bundle")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        
        do {
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
        } catch {
            // Couldn't create audio player object, log the error
            print("Couldn't create audio player object for sound file \(soundFileName)")
        }
    }
}
