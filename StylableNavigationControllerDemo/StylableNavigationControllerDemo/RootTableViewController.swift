//
//  RootTableViewController.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

extension RootTableViewController: NavigationBarStylable {
    
    var navigationBarStyle: NavigationControllerStyle? {
        return .lightTinted(tintColor: .lightGray)
    }
}
