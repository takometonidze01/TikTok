//
//  PostModel.swift
//  TikTok
//
//  Created by CodergirlTM on 05.02.22.
//

import UIKit

struct PostModel {
    
    let identifier: String
    
    static func mockModels() -> [PostModel] {
        var posts = [PostModel]()
        for _ in 0...100 {
            var post = PostModel(identifier: UUID().uuidString)
            posts.append(post)
        }
        return posts
    }
}
