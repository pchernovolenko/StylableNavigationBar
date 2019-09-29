//
//  StylableNavigationController.swift
//  StylableNavigationControllerDemo
//
//  Created by Pavlo Chernovolenko on 9/29/19.
//  Copyright © 2019 Pavlo Chernovolenko. All rights reserved.
//

import UIKit

public enum NavigationControllerStyle {
    case `default`
    case darkTinted(tintColor: UIColor)
    case lightTinted(tintColor: UIColor)
}

// A protocol wich allow UIViewController to specify it's navigation bar style preferences.
// You dont have to make all navigation controller childs as CSNavigationBarStylable,
// a root view controller's prefered style will be applyed for all childs if they are not CSNavigationBarStylable.

public protocol NavigationBarStylable: class {
    var navigationBarStyle: NavigationControllerStyle? { get }
}

public extension NavigationBarStylable {
    
    // The default navigationBarStyle is white
    var navigationBarStyle: NavigationControllerStyle? {
        return .default
    }
}

open class StylableNavigationController: UINavigationController {
    
    // MARK: Overrides
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        guard let rootViewController = self.viewControllers.first else { return }
        setNavigationBarStyleFor(rootViewController)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.setNavigationBarStyleFor(viewController)
        super.pushViewController(viewController, animated: animated)
    }
    
    open override func popViewController(animated: Bool) -> UIViewController? {
        
        if let style = self.previousViewController {
            self.setNavigationBarStyleFor(style)
        }
        
        // - Let's start pop action or we can't get transitionCoordinator()
        let popViewController = super.popViewController(animated: animated)
        
        // - Secure situation if user cancelled transition
        transitionCoordinator?.animate(alongsideTransition: nil, completion: { [weak self] _ in
            guard let style = self?.topViewController else { return }
            self?.setNavigationBarStyleFor(style)
        })
        
        return popViewController
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        guard let viewController = topViewController else { return super.preferredStatusBarStyle }
        return viewController.preferredStatusBarStyle
    }
    
    open func setNeedsNavigationBarAppearanceUpdate() {
        guard let topViewController = topViewController else { return }
        self.setNavigationBarStyleFor(topViewController)
    }
}

private extension StylableNavigationController {
    
    var previousViewController: UIViewController? {
        guard viewControllers.count > 1 else { return nil }
        return viewControllers[viewControllers.count - 2]
    }
    
    // Apply navigation bar style for ViewController
    func setNavigationBarStyleFor(_ viewController: UIViewController) {
        guard
            let stylableController = viewController as? NavigationBarStylable,
            let style = stylableController.navigationBarStyle
            else {
                self.setDefaultNavigationBarStyleFor(viewController)
                return
        }
        self.applyNavigationBarStyle(style, for: viewController)
    }
    
    // Apply root's navigation bar style for ViewController
    func setDefaultNavigationBarStyleFor(_ viewController: UIViewController) {
        guard
            let rootVC = self.viewControllers.first as? NavigationBarStylable,
            let style = rootVC.navigationBarStyle
            else { return }
        self.applyNavigationBarStyle(style, for: viewController)
    }
    
    func applyNavigationBarStyle(_ style: NavigationControllerStyle, for viewController: UIViewController) {
        
        let barColor: UIColor
        let barTintColor: UIColor
        
        switch style {
        case .default:
            navigationBar.isTranslucent = false
            barColor = .red
            barTintColor = .white
        case let .darkTinted(tintColor):
            navigationBar.isTranslucent = false
            barColor = tintColor
            barTintColor = .white
        case let .lightTinted(tintColor):
            navigationBar.isTranslucent = false
            barColor = tintColor
            barTintColor = UIColor.black
        }
        
        self.navigationBar.tintColor = barTintColor
        self.navigationBar.barTintColor = barColor
        self.view.backgroundColor = barColor
    }
}
