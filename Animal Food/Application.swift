//
//  Application.swift
//  Animal Food
//
//  Created by Idan Moshe on 02/08/2020.
//  Copyright © 2020 Idan Moshe. All rights reserved.
//

import Foundation
import UIKit

class Application: NSObject {
    
    // MARK: - Constants
    
    static let FileName: String = "animals"
    static let FileExtension: String = "animals"
    
    enum FoodType: Int {
        case flora // צמחיה
    }
    
    enum AnimalName: String {
        case polar_bear
        case bee
        case butterfly
        case cat
        case chicken
        case crab
        case deer
        case elephant
        case fish
        case flamingo
        case fox
        case jellyfish
        case ladybug
        case lion
        case panda
        case rabbit
        case sealion
        case snail
        case squirrel
        case starfish
        case turtle
        case whale
    }
    
    // MARK: - Singleton
    
    static let shared = Application()
    private override init() {
      super.init()
    }
    
}
