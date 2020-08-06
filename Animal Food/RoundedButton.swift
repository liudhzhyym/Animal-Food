//
//  RoundedButton.swift
//  Animal Food
//
//  Created by Idan Moshe on 02/08/2020.
//  Copyright © 2020 Idan Moshe. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                self.layer.borderColor = UIColor.emeraldFlatColor.cgColor
            } else {
                self.layer.borderColor = UIColor.carrotFlatColor.cgColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.width/4
        self.layer.borderWidth = 4.0
        self.layer.borderColor = UIColor.carrotFlatColor.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.imageEdgeInsets = UIEdgeInsets(top: 10, left:10, bottom: 10, right: 10)
    }
    
}
