//
//  MSArticleModel.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/29/15.
//  Copyright © 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

class MSArticleModel: NSObject {

    
    class func loadAllArticles(completion:(articles:[MSArticle])->()) {
        let sql = "select * from MSArticle"
        AVQuery.doCloudQueryInBackgroundWithCQL(sql) { (result, error) -> Void in
            
            if error != nil {
                return
            }
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                var articleData:[MSArticle] = []
                for obj in result.results {
                    let article = MSArticle(avObj: obj as! AVObject)
                    articleData.append(article)
                    //                article.uploadImageFile(obj as! AVObject, completion: { () -> () in
                    //                    print("upload success")
                    //                })
                }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completion(articles: articleData)
                })
            })
        }
    }
    
    class func syncLoadImageWithAVFile(avFile:AVFile)->String? {
        let sql = "select * from _File where objectId = \"\(avFile.objectId)\""
        print("objectId:" + avFile.objectId + ", sql: " + sql)
        let result = AVQuery.doCloudQueryWithCQL(sql)
        if let results = result.results {
            let obj = results.first as! AVObject
            return obj.objectForKey("url") as? String
        }
        return nil
    }
    
    class func loadImageWithAVFile(avFIle:AVFile, completion:(imageUrl:String)->()) {
        let sql = "select * from _File where objectId = \"\(avFIle.objectId)\""
        print("objectId:" + avFIle.objectId + ", sql: " + sql)
        AVQuery.doCloudQueryInBackgroundWithCQL(sql) { (result, error) -> Void in
            if result.results.count > 0 {
                let obj = result.results.first as! AVObject
                let imageUrl = obj.objectForKey("url") as! String
                completion(imageUrl: imageUrl)
            }
        }
    }
}
