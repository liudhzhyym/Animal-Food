//
//  SoundManager.swift
//  Animal Food
//
//  Created by Idan Moshe on 06/08/2020.
//  Copyright © 2020 Idan Moshe. All rights reserved.
//

import UIKit
import AVFoundation

class SoundManager: NSObject {
    
    static let shared = SoundManager()
    
    var languageCode: String = "he-IL"
    
    private var player: AVAudioPlayer?
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: self.languageCode)
        utterance.rate = 0.4

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func play(soundName: String) -> Bool {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return false }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            self.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = self.player else { return false }

            player.play()
            return true
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
}
