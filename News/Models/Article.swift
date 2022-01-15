//
//  Article.swift
//  News
//
//  Created by Gordon Choi on 2022/01/15.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
