//
//  DemoListViewController.swift
//  LXMWaterfallLayout
//
//  Created by luxiaoming on 2017/8/26.
//  Copyright © 2017年 duowan. All rights reserved.
//

import UIKit

private let UITableViewCellReuseIdentifier: String = "UITableViewCell"

class DemoListViewController: UIViewController {

    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: UITableViewCellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    fileprivate var dataArray: [String] = ["LXMWaterfallLayout",
                                           "LXMHeaderFooterFlowLayout",
                                           "UICollectionViewFlowLayout"]

}

// MARK: - Lifecycle
extension DemoListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - UITableViewDataSource
extension DemoListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
}


// MARK: - UITableViewDelegate
extension DemoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController = DemoBaseViewController()
        if indexPath.row == 0 {
            viewController = WaterfallViewController()
        } else if indexPath.row == 1 {
            viewController = HeaderFooterViewController()
        } else {
            viewController = FlowViewController()
        }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
