//
//  WebService.swift
//  News
//
//  Created by Gordon Choi on 2022/01/15.
//

import Foundation

class WebService {
    
}

extension WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data
            else {
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                }
                return
            }
            
            guard let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
            else { return }
            
            completion(articleList.articles)
            print(articleList.articles)
        }
        
        task.resume()
    }
}
