//
//  MSMusesCell.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/29/15.
//  Copyright © 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

class MSMusesCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    var article:MSArticle? {
        didSet {
            titleLable.text = self.article?.title as? String
            descLabel.text = self.article?.content as? String
            let url = NSURL(string: (self.article?.image as? String)!)
            self.articleImage.sd_setImageWithURL(url, placeholderImage: UIImage(named: "default_image"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.backgroundColor = UIColor.whiteColor()
        bgView.layer.shadowColor = UIColor.grayColor().CGColor
        bgView.layer.shadowOpacity = 1
        bgView.layer.cornerRadius = 5
        
    }

}
