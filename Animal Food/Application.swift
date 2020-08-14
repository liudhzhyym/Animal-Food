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
    
    let adUnitID: String = "ca-app-pub-6158225633661411/8662259003"
    
    enum FileResources {
        static let fileName: String = "animals"
        static let fileExtension: String = "json"
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
