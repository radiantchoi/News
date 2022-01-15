//
//  NewsListTableViewController.swift
//  News
//
//  Created by Gordon Choi on 2022/01/15.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var viewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension NewsListTableViewController {
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=5f84542823344f03816778d2583d6b30")!
        
        WebService().getArticles(url: url) { articles in
            guard let articles = articles
            else { return }
            
            self.viewModel = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticelTableViewCell",
                                                       for: indexPath) as? ArticleTableViewCell
        else { fatalError("Cell not found") }
        
        let vm = self.viewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = vm.title
        cell.descriptionLabel.text = vm.description
        return cell
    }
}
