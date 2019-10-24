//
//  ViewModel.swift
//  StylableNavigationBar_Example
//
//  Created by Pavlo Chernovolenko on 9/30/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import StylableNavigationBar

struct CellViewModel {
    let title: String
    let description: String
    let style: NavigationBarStyleProtocol
}

protocol ViewModelProtocol {
    var cellViewModels: [CellViewModel] { get }
}

class ViewModel: ViewModelProtocol {
    var cellViewModels: [CellViewModel] = [
        CellViewModel(
            title: "Black Tinted Bar",
            description: "White status bar",
            style: AppBlackNavigationBarStyle()
        ),
        CellViewModel(
            title: "Light Tinted Bar",
            description: "Black status bar",
            style: AppPrimaryNavigationBarStyle()
        ),
        CellViewModel(
            title: "Dark Tinted Bar",
            description: "White status bar",
            style: AppSecondaryNavigationBarStyle()
        )
    ]
}
