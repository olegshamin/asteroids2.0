//
//  SettingsPresenter.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

protocol SettingsPresentationLogic: AsyncPresentationLogic {}

final class SettingsPresenter: SettingsPresentationLogic, AsyncPresentationLogicInternal {

    typealias DisplayLogic = SettingsDisplayLogic

    // MARK: Properties

    weak var viewController: SettingsDisplayLogic?

    // MARK: Initialization

    init(
        viewController: SettingsDisplayLogic
        ) {
        self.viewController = viewController
    }

    // MARK: SettingsPresentationLogic
}
