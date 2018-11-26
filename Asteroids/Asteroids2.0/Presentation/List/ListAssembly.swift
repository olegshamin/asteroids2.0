//
//  ListAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

class ListAssemblyImpl: Assembly {

    func configure(viewController: UIViewController) {

        guard let viewController = viewController as? ListViewController else {
            return
        }

        let presenter = ListPresenter(viewController: viewController)
        let asteroidService = ServiceFactory.shared.asteroidService
        let interactor = ListInteractor(presenter: presenter,
                                        asteroidService: asteroidService)
        viewController.interactor = interactor
        let router = ListRouter(viewController: viewController,
                                dataStore: interactor)
        viewController.router = router
        viewController.segueHandler = router
    }
}
