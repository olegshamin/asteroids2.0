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
        return AsteroidServiceImpl(scheduler: scheduler(),
                                   networkRepository: networkRepository(),
                                   databaseRepository: databaseRepository())
    }

    // MARK: Repositories

    private func networkRepository() -> AsteroidRepository {
        return AsteroidNetworkRepository(transport: transport(),
                                         deserializer: deserializer(),
                                         networkMapper: networkMapper())
    }

    private func databaseRepository() -> AsteroidRepository {
        return AsteroidDatabaseRepository()
    }

    // MARK: Mapper

    private func networkMapper() -> AsteroidNetworkMapper {
        return AsteroidNetworkMapperImpl()
    }
}
