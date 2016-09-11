//
//  MSContentTableViewCell.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/24/15.
//  Copyright (c) 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

class MSContentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var subTitleView: UIView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var bottomLine: UIView!
    
    var article:MSArticle? {
        didSet {
            self.titleLabel.text = self.article?.title as? String
            self.authorLabel.text = self.article?.author as? String
            self.subTitleLabel.text = self.article?.subTitle as? String
            self.contentText.text = self.article?.content as? String
            self.topicLabel.text = self.article?.topic as? String
            let url = NSURL(string: self.article?.image as! String)
            self.contentImage.sd_setImageWithURL(url, placeholderImage: UIImage(named: "default_image"))
            
            self.setNeedsLayout()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupArticleData(article:MSArticle) {
        
    }

}
