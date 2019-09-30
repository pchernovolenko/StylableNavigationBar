//
//  UINavigationBar+Stylable.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func applyStyle(_ style: NavigationBarStyleProtocol) {
        applyColors(
            barColor: style.barColor,
            barTintColor: style.tintColor
        )
    }
    
    func applyColors(barColor: UIColor?, barTintColor: UIColor) {
        self.isTranslucent = false
        self.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: barTintColor
        ]
        self.tintColor = barTintColor
        self.barTintColor = barColor
        guard #available(iOS 11.0, *) else { return }
        self.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: barTintColor
        ]
    }
}
