//
//  ListRouter.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

@objc protocol ListRoutingLogic {}

protocol ListDataPassing {
    var dataStore: ListDataStore { get }
}

@objc class ListRouter: NSObject, ListRoutingLogic, ListDataPassing {

    // MARK: Properties

    weak var viewController: ListViewController?

    // MARK: ListDataPassing

    var dataStore: ListDataStore

    // MARK: Initialization

    init(
        viewController: ListViewController,
        dataStore: ListDataStore
        ) {
        self.viewController = viewController
        self.dataStore = dataStore
        super.init()
    }

    // MARK: Routing
    // MARK: Navigation
    // MARK: Passing data
}
