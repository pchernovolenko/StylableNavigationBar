//
//  UINavigationController+CompletionExtensions.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    public func pushViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    public func popViewController(animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
}

// gives control of the status bar appearance to the top controller
extension UINavigationController {
    
    override open var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}
