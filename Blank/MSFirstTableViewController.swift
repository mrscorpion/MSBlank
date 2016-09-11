//
//  MSFirstTableViewController.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/24/15.
//  Copyright (c) 2015 Mr.Scorpion. All rights reserved.
//  首页

import UIKit

class MSFirstTableViewController: LMBaseTableViewController {

    var artitleData:[MSArticle]!
    
    var poperCell:MSContentTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "MSContentCell", bundle: nil), forCellReuseIdentifier: "articleCell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.poperCell = self.tableView.dequeueReusableCellWithIdentifier("articleCell") as! MSContentTableViewCell
        
        self.navigationController?.navigationBar.setBarShadow()
        self.navigationController?.navigationBar.translucent = false
        
        MSArticleModel.loadAllArticles { (articles) -> () in
            self.artitleData = articles
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.artitleData {
            return data.count
        }
        else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! MSContentTableViewCell
        let article = self.artitleData[indexPath.row] as MSArticle
        cell.article = article
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.subTitleView.layer.shadowColor = UIColor.grayColor().CGColor
        cell.subTitleView.layer.shadowOpacity = 1
        cell.subTitleView.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.subTitleView.layer.cornerRadius = 5
        return cell
    }

    // MARK: tabelview delegate
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let article = self.artitleData[indexPath.row] as MSArticle
        self.poperCell.article = article
        let size = poperCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        return size.height + 1
    }
}
