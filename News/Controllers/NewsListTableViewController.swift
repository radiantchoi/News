//
//  NewsListTableViewController.swift
//  News
//
//  Created by Gordon Choi on 2022/01/15.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension NewsListTableViewController {
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
