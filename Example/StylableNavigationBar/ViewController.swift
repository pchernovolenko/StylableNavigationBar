//
//  ViewController.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit
import StylableNavigationBar

class ViewController: UITableViewController {

    var viewModel: ViewModelProtocol = ViewModel()
    var barStyle: NavigationBarStyleProtocol = AppSecondaryNavigationBarStyle()
    
    private enum Constants {
        static var storyboardName = "Main"
        static var controllerId = "RootViewController"
    }
    
    static func makeViewController(barStyle: NavigationBarStyleProtocol) -> ViewController? {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: Constants.controllerId)
        guard let tableController = controller as? ViewController else { return nil }
        tableController.barStyle = barStyle
        return tableController
    }
}

// MARK: Table view data source
extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell") as? StyleCell
        else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        cell.textLabel?.text = cellViewModel.title
        cell.detailTextLabel?.text = cellViewModel.description
        cell.colorExampleView.backgroundColor = cellViewModel.style.barColor
        cell.textStyleExampleLabel.textColor = cellViewModel.style.tintColor
        return cell
    }
}

// MARK: Table view delegate
extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        guard
            let navigationController = self.navigationController,
            let newController = ViewController.makeViewController(barStyle: cellViewModel.style)
        else { return }
        newController.title = cellViewModel.title
        navigationController.pushViewController(newController, animated: true)
    }
}

// MARK: NavigationBarStylable
extension ViewController: NavigationBarStylable {
    
    var navigationBarStyle: NavigationControllerStyle? {
        return .custom(style: barStyle)
    }
}
