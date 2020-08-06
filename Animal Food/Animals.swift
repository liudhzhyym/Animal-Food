//
//  Animals.swift
//  Animal Food
//
//  Created by Idan Moshe on 02/08/2020.
//  Copyright © 2020 Idan Moshe. All rights reserved.
//

// MARK: - Animals

struct Animals: Codable {
    let animals: [Animal]
}

// MARK: - Animal

struct Animal: Codable {
    
    let name: String
    let image: String
    let food: FoodTypeEnum
    let localizedFood: String
    
    func isEqual(to secondAnimal: Animal) -> Bool {
        return self.name == secondAnimal.name &&
            self.image == secondAnimal.image &&
            self.food == secondAnimal.food &&
            self.localizedFood == secondAnimal.localizedFood
    }
    
}

enum FoodTypeEnum: String, Codable, CaseIterable {
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
        case .milk:
            return "חלב"
        case .nectar:
            return "צוף"
        case .leaves:
            return "עלים"
        case .bamboo:
            return "במבוק"
        case .nut:
            return "אגוזים"
        case .fish:
            return "דגים"
        case .insects:
            return "חרקים"
        case .invertebrate:
            return "חסרי חוליות"
        case .meat:
            return "בשר"
        case .ant:
            return "נמלה"
        case .hay:
            return "חציר"
        case .bananas:
            return "בננות"
        case .carrot:
            return "גזרים"
        case .grass:
            return "עשב"
        case .bone:
            return "עצמות"
        case .seeds:
            return "זרעים"
        case .worm:
            return "תולעים"
        }
    }
    
}
