//
//  SettingsRouter.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

@objc protocol SettingsRoutingLogic {}

protocol SettingsDataPassing {
    var dataStore: SettingsDataStore { get }
}

@objc class SettingsRouter: NSObject, SettingsRoutingLogic, SettingsDataPassing {

    // MARK: Properties

    weak var viewController: SettingsViewController?

    // MARK: SettingsDataPassing

    var dataStore: SettingsDataStore

    // MARK: Initialization

    init(
        viewController: SettingsViewController,
        dataStore: SettingsDataStore
        ) {
        self.viewController = viewController
        self.dataStore = dataStore
        super.init()
    }

    // MARK: Routing
    // MARK: Navigation
    // MARK: Passing data
}
