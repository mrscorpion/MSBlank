//
//  MSNavigationExtion.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/30/15.
//  Copyright © 2015 Mr.Scorpion. All rights reserved.
//

import Foundation

extension UINavigationBar {
    
    func setBarShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowColor = UIColor.grayColor().CGColor
        self.layer.shadowOpacity = 0.8
    }
    
}