//
//  ArticleViewModel.swift
//  News
//
//  Created by Gordon Choi on 2022/01/15.
//

import Foundation

struct ArticleViewModel {
    private let article: Article

    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        article.title
    }
    
    var description: String {
        article.description
    }
}
