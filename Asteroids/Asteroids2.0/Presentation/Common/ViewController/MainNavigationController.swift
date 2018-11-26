//
//  MainNavigationController.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

final class MainNavigationController: UINavigationController {

    // MARK: Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setupAppearance()
    }

    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        setupAppearance()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupAppearance()
    }

    // MARK: Private Helpers

    private func setupAppearance() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .hexFAFAFA
        navigationBar.tintColor = .hex567DC6
    }
}
