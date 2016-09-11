//
//  MSSlideViewController.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/28/15.
//  Copyright © 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

let MENU_BTN_TAG_REF = 100

class MSSlideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK - menu button click
    @IBAction func menuButtonClick(sender: AnyObject) {
        
        let tabVC = self.sideMenuViewController.contentViewController as! UITabBarController
        let btn = sender as! UIButton
        tabVC.selectedIndex = btn.tag - MENU_BTN_TAG_REF - 1
        self.sideMenuViewController.hideMenuViewController()
    }
    
}
