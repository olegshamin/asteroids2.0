//
//  SearchAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

class SearchAssemblyImpl: Assembly {

    func configure(viewController: UIViewController) {

        guard let viewController = viewController as? SearchViewController else {
            return
        }

        let presenter = SearchPresenter(viewController: viewController)
        let interactor = SearchInteractor(presenter: presenter)
        viewController.interactor = interactor
        let router = SearchRouter(viewController: viewController, dataStore: interactor)
        viewController.router = router
        viewController.segueHandler = router
    }
}
