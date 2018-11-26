//
//  AsteroidServiceAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol AsteroidServiceAssembly {
    func service() -> AsteroidService
}

final class AsteroidServiceAssemblyImpl: ServiceAssembly, AsteroidServiceAssembly {

    // MARK: AsteroidServiceAssembly

    func service() -> AsteroidService {
        return AsteroidServiceImpl(scheduler: self.scheduler(),
                                   networkRepository: self.networkRepository(),
                                   databaseRepository: self.databaseRepository())
    }

    // MARK: Repositories

    private func networkRepository() -> AsteroidRepository {
        return AsteroidNetworkRepository(transport: self.transport())
    }

    private func databaseRepository() -> AsteroidRepository {
        return AsteroidDatabaseRepository()
    }
}
