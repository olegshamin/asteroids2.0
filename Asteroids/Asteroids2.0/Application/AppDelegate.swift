//
//  AppDelegate.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 16/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {

        setupEnvironment()

        return true
    }

    private func setupEnvironment() {
        ServiceFactory.shared.hostService.setHost(Constants.baseURL)
        ServiceFactory.shared.apiVersionService.setApiVersionNumber(1)
    }

}
