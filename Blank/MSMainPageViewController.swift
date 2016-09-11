//
//  MSMainPageViewController.swift
//  Blank
//
//  Created by Mr.Scorpion on 8/5/15.
//  Copyright © 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

class MSMainPageViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBarShadow()
        self.mainButton.imageView?.contentMode = UIViewContentMode.Center
        
//        let blurFilter = GPUImageGaussianBlurFilter()
//        blurFilter.blurRadiusInPixels = 14
//        self.bgImage.image = blurFilter.imageByFilteringImage(UIImage(named: "MainPageBG"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSlideMenu(sender: AnyObject) {
        self.sideMenuViewController.presentLeftMenuViewController()
    }

    //MARK - unwind segue

    @IBAction func unwindForSegue(unwindSegue: UIStoryboardSegue) {
        
    }

}
