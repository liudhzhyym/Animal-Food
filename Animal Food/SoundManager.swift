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
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: self.languageCode)
        utterance.rate = 0.4

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
}
