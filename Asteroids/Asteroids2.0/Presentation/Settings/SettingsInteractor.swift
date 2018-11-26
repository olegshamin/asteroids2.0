//
//  SettingsInteractor.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol SettingsBusinessLogic {}

protocol SettingsDataStore {}

final class SettingsInteractor: SettingsBusinessLogic, SettingsDataStore {

    // MARK: Properties

    var presenter: SettingsPresentationLogic

    // MARK: SettingsDataStore

    // MARK: Initialization

    init(
        presenter: SettingsPresentationLogic
        ) {
        self.presenter = presenter
    }

    // MARK: SettingsBusinessLogic
}
