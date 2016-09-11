//
//  MSSecondTableViewController.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/26/15.
//  Copyright © 2015 Mr.Scorpion. All rights reserved.
//  推荐页面

import UIKit

class MSSecondTableViewController: LMBaseTableViewController {

    var articleData:[MSArticle]?
    var propertyCell:MSMusesCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MSArticleModel.loadAllArticles({ (articles) -> () in
            self.articleData = articles
            self.tableView.reloadData()
        })
        self.propertyCell = tableView.dequeueReusableCellWithIdentifier("musesCell") as! MSMusesCell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = articleData {
            return data.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("musesCell", forIndexPath: indexPath) as! MSMusesCell
        cell.article = self.articleData![indexPath.row]
        let path = UIBezierPath(rect: cell.bgView.bounds)
        cell.bgView.layer.shadowPath = path.CGPath
        return cell
    }
    
    // MARK: - table view delegate
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let article = self.articleData![indexPath.row] as MSArticle
//        self.propertyCell.article = article
//        let size = self.propertyCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//        return size.height
        return 299
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%ld", indexPath.row);
    }
}
