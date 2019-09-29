//
//  RootTableViewController.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit
import StylableNavigationBar

class RootTableViewController: UITableViewController {

    var barStyle: NavigationBarStyleProtocol = AppSecondaryNavigationBarStyle()
    
    private enum Constants {
        static var storyboardName = "Main"
        static var controllerId = "RootViewController"
    }
    
    static func makeViewController(barStyle: NavigationBarStyleProtocol) -> RootTableViewController? {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: Constants.controllerId)
        guard let tableController = controller as? RootTableViewController else { return nil }
        tableController.barStyle = barStyle
        return tableController
    }
}

// MARK: Table view data source
extension RootTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell") ?? UITableViewCell()
        cell.textLabel?.text = "Title"
        cell.detailTextLabel?.text = "Details"
        return cell
    }
}

// MARK: Table view delegate
extension RootTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let style: NavigationBarStyleProtocol = (indexPath.row % 2 == 0) ? AppPrimaryNavigationBarStyle() : AppSecondaryNavigationBarStyle()
        guard
            let navigationController = self.navigationController,
            let newController = RootTableViewController.makeViewController(barStyle: style)
        else { return }
        navigationController.pushViewController(newController, animated: true)
    }
}

// MARK: NavigationBarStylable
extension RootTableViewController: NavigationBarStylable {
    
    var navigationBarStyle: NavigationControllerStyle? {
        return .custom(style: barStyle)
    }
}
