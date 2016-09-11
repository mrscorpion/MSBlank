//
//  MSArticle.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/24/15.
//  Copyright (c) 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

class MSArticle: NSObject {
   
    private(set) var title:NSString?
    private(set) var subTitle:NSString?
    private(set) var author:NSString?
    private(set) var image:NSString?
    private(set) var content:NSString?
    private(set) var topic:NSString?
    private(set) var imageFile:AVFile?
    init(avObj:AVObject) {
        
        super.init()
        
        self.title = avObj.objectForKey("title") as? String
        self.subTitle = avObj.objectForKey("subTitle") as? String
        self.author = "文/" + (avObj.objectForKey("author") as! String)
        self.topic = avObj.objectForKey("topic") as? String
        self.content = avObj.objectForKey("content") as? String
        
        let avFile = avObj.objectForKey("imageFile") as? AVFile
        self.image = MSArticleModel.syncLoadImageWithAVFile(avFile!)
    }
    
    func uploadImageFile(avObj:AVObject, completion:()->()) {
        let image = UIImage(named: self.image! as String)
        let data = UIImageJPEGRepresentation(image!, 0.5)
        let file = AVFile.fileWithName(self.image! as String, data: data)
        file.saveInBackgroundWithBlock { (finish, error) -> Void in
            avObj.setObject(file, forKey: "imageFile")
            avObj.saveInBackgroundWithBlock({ (finish, error) -> Void in
                completion()
            })
        }
    }
    
}
