//
//  AppSecondaryNavigationBarStyle.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit

struct AppSecondaryNavigationBarStyle: NavigationBarStyleProtocol {
    var barColor: UIColor? = UIColor(named: "secondaryBarColor")
    var tintColor: UIColor = UIColor(named: "secondaryBarTintColor") ?? UIColor()
    var statusBarStyle: UIStatusBarStyle = .lightContent
}
