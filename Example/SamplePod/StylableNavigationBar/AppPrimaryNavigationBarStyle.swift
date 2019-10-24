//
//  AppPrimaryNavigationBarStyle.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit
import StylableNavigationBar

struct AppPrimaryNavigationBarStyle: NavigationBarStyleProtocol {
    var barColor: UIColor? = UIColor(named: "mainBarColor")
    var tintColor: UIColor = UIColor(named: "mainBarTintColor") ?? UIColor()
    var statusBarStyle: UIStatusBarStyle = .default
}
