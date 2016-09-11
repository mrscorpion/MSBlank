//
//  LMBaseTableViewController.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/26/15.
//  Copyright © 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

class LMBaseTableViewController: UITableViewController {

    var fullView:UIView!
    var curSelectBtn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBarShadow()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickListBtn(sender: AnyObject) {
//        self.showOrHideListView()
        self.sideMenuViewController.presentLeftMenuViewController()
    }

}
