//
//  AppBlackNavigationBarStyle.swift
//  StylableNavigationBar_Example
//
//  Created by Pavlo Chernovolenko on 9/30/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import StylableNavigationBar

struct AppBlackNavigationBarStyle: NavigationBarStyleProtocol {
    var barColor: UIColor? = .black
    var tintColor: UIColor = .white
    var statusBarStyle: UIStatusBarStyle = .lightContent
}
