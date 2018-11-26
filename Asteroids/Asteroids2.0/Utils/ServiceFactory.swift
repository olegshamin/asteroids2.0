//
//  ServiceFactory.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

final class ServiceFactory {

    // MARK: Public properties

    static let shared = ServiceFactory()

    // Services
    let localStoreService: LocalStoreService
    let hostService: HostService
    let apiVersionService: APIVersionService
    let asteroidService: AsteroidService

    // MARK: Initialization

    private init() {

        // Assembly

        let localStoreServiceAssembly = LocalStoreServiceAssemblyImpl()
        let hostServiceAssembly = HostServiceAssemblyImpl(localStoreServiceAssembly: localStoreServiceAssembly)
        let apiVersionServiceAssembly = APIVersionServiceAssemblyImpl(
            localStoreServiceAssembly: localStoreServiceAssembly
        )

        // Service

        self.localStoreService = localStoreServiceAssembly.service()
        self.hostService = hostServiceAssembly.service()
        self.apiVersionService = apiVersionServiceAssembly.service()
        self.asteroidService = AsteroidServiceAssemblyImpl().service()
    }
}
