//
//  ServiceAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Base class for service assemblies.
/// Service assembly is an object which is responsible for instansiating service objects.
class ServiceAssembly {

    // MARK: User Defaults

    func userDefaults() -> UserDefaults {
        return UserDefaults.standard
    }

    // MARK: Service Components

    func scheduler() -> Scheduler {
        return GCDScheduler()
    }

    // MARK: Network Repository Components

    func transport() -> Transport {
        return AlamofireTransport()
    }
}
