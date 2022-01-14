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
    func getArticles(url: URL, completion: @escaping ([Any]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
            }
        }
    }
}
