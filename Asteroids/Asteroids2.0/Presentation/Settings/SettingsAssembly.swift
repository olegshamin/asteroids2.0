//
//  SettingsAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

class SettingsAssemblyImpl: Assembly {

    func configure(viewController: UIViewController) {

        guard let viewController = viewController as? SettingsViewController else {
            return
        }

        let presenter = SettingsPresenter(viewController: viewController)
        let interactor = SettingsInteractor(presenter: presenter)
        viewController.interactor = interactor
        let router = SettingsRouter(viewController: viewController, dataStore: interactor)
        viewController.router = router
        viewController.segueHandler = router
    }
}
