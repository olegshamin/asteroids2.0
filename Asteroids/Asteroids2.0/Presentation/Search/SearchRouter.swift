//
//  SearchRouter.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

@objc protocol SearchRoutingLogic {}

protocol SearchDataPassing {
    var dataStore: SearchDataStore { get }
}

@objc class SearchRouter: NSObject, SearchRoutingLogic, SearchDataPassing {

    // MARK: Properties

    weak var viewController: SearchViewController?

    // MARK: SearchDataPassing

    var dataStore: SearchDataStore

    // MARK: Initialization

    init(
        viewController: SearchViewController,
        dataStore: SearchDataStore
        ) {
        self.viewController = viewController
        self.dataStore = dataStore
        super.init()
    }

    // MARK: Routing
    // MARK: Navigation
    // MARK: Passing data
}
