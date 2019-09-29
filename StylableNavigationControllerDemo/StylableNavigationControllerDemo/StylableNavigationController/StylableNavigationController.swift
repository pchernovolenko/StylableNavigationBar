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
    case custom(style: NavigationBarStyleProtocol)
}

// A protocol wich allow UIViewController to specify it's navigation bar style preferences
public protocol NavigationBarStylable: class {
    var navigationBarStyle: NavigationControllerStyle? { get }
}

public extension NavigationBarStylable {
    
    var navigationBarStyle: NavigationControllerStyle? {
        return .default
    }
}

open class StylableNavigationController: UINavigationController {
    
    // MARK: Overrides
    
    // Apply status bar style for ViewController
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        guard
            let viewController = topViewController as? NavigationBarStylable,
            let navBarStyle = viewController.navigationBarStyle
        else {
            return super.preferredStatusBarStyle
        }
        switch navBarStyle {
        case .darkTinted:
            return .lightContent
        case .lightTinted:
            if #available(iOS 13.0, *) {
                return .default
            } else {
                return .default
            }
        case let .custom(style):
            return style.statusBarStyle
        default:
            return .default
        }
    }
    
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
        
        // Let's start pop action or we can't get transitionCoordinator()
        let popViewController = super.popViewController(animated: animated)
        
        // Secure situation if user cancelled transition
        transitionCoordinator?.animate(alongsideTransition: nil, completion: { [weak self] _ in
            guard let style = self?.topViewController else { return }
            self?.setNavigationBarStyleFor(style)
        })
        
        return popViewController
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
        else { return }
        self.applyNavigationBarStyle(style, for: viewController)
    }
    
    func applyNavigationBarStyle(_ style: NavigationControllerStyle, for viewController: UIViewController) {
        switch style {
        case .default:
            self.navigationBar.applyColors(barColor: nil, barTintColor: .black)
        case let .darkTinted(tintColor):
            self.navigationBar.applyColors(barColor: tintColor, barTintColor: .white)
        case let .lightTinted(tintColor):
            self.navigationBar.applyColors(barColor: tintColor, barTintColor: .black)
        case let .custom(style):
            self.navigationBar.applyStyle(style)
        }
    }
}
