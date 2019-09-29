//
//  BasicNavigationBarStyle.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit

public protocol NavigationBarStyleProtocol {
    var barColor: UIColor? { get }
    var tintColor: UIColor { get }
    var statusBarStyle: UIStatusBarStyle { get }
}

struct BasicNavigationBarStyle: NavigationBarStyleProtocol {
    var barColor: UIColor? = nil
    var tintColor: UIColor = .black
    var statusBarStyle: UIStatusBarStyle = .default
}
