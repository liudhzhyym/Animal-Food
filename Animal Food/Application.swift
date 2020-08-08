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
    
    // MARK: - Singleton
    
    static let shared = Application()
    
    private override init() {
      super.init()
    }
    
    // MARK: - Constants
    
    let isIPAD: Bool = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    
    enum FileResources {
        static let fileName: String = "animals"
        static let fileExtension: String = "json"
    }
        
    enum FoodType: String, Codable, CaseIterable {
        case milk
        case nectar
        case leaves
        case bamboo
        case nut
        case fish
        case insects
        case invertebrate
        case meat
        case ant
        case hay
        case bananas
        case carrot
        case grass
        case bone
        case seeds
        case worm
        
        static let values: [FoodTypeEnum] = FoodTypeEnum.allCases
        
        var localized: String {
            switch self {
            case .milk: return "חלב"
            case .nectar: return "צוף"
            case .leaves: return "עלים"
            case .bamboo: return "במבוק"
            case .nut: return "אגוזים"
            case .fish: return "דגים"
            case .insects: return "חרקים"
            case .invertebrate: return "חסרי חוליות"
            case .meat: return "בשר"
            case .ant: return "נמלה"
            case .hay: return "חציר"
            case .bananas: return "בננות"
            case .carrot: return "גזרים"
            case .grass: return "עשב"
            case .bone: return "עצמות"
            case .seeds: return "זרעים"
            case .worm: return "תולעים"
            }
        }
    }
    
    enum AnimalName: String {
        case tiger
        case horse
        case bee
        case butterfly
        case frog
        case panda
        case squirrel
        case turtle
        case otter
        case whale
        case lion
        case monkey
        case rabbit
        case cow
        case goat
        case dog
        case chicken
        case cat
        case anteater
        
        var localized: String {
            switch self {
            case .tiger: return "טיגריס"
            case .horse: return "סוס"
            case .bee: return "דבורה"
            case .butterfly: return "פרפר"
            case .frog: return "צפרדע"
            case .panda: return "דב פנדה"
            case .squirrel: return "סנאי"
            case .turtle: return "צב"
            case .otter: return "לוטרה"
            case .whale: return "לוויתן"
            case .lion: return "אריה"
            case .monkey: return "קוף"
            case .rabbit: return "ארנב"
            case .cow: return "פרה"
            case .goat: return "עז"
            case .dog: return "כלב"
            case .chicken: return "תרנגול"
            case .cat: return "חתול"
            case .anteater: return "דב נמלים"
            }
        }
    }
    
    // MARK: - Configuration
    
    enum Configurations {
        static let speakerPointSize: CGFloat = Application.shared.isIPAD ? 65 : 45
        static let animalImageSize: CGSize = Application.shared.isIPAD ? CGSize(width: 350, height: 250) : CGSize(width: 200, height: 150)
        static let answersLabelHeight: CGFloat = Application.shared.isIPAD ? 35.0 : 25.0
        static let answersImageHeight: CGFloat = Application.shared.isIPAD ? 150.0 : 100.0
        static let answersLabelFont: UIFont = Application.shared.isIPAD ? UIFont.systemFont(ofSize: 24) : UIFont.systemFont(ofSize: 17)
    }
    
}
