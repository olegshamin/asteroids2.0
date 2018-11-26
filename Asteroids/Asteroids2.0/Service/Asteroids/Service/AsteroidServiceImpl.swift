//
//  AsteroidServiceImpl.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

final class AsteroidServiceImpl: AsteroidService {

    // MARK: Private properties

    private let scheduler: Scheduler
    private let networkRepository: AsteroidRepository
    private let databaseRepository: AsteroidRepository

    // MARK: Initialization

    init(
        scheduler: Scheduler,
        networkRepository: AsteroidRepository,
        databaseRepository: AsteroidRepository
        ) {
        self.scheduler = scheduler
        self.networkRepository = networkRepository
        self.databaseRepository = databaseRepository
    }

    // MARK: AsteroidService

    func asteroids(completion: @escaping AsteroidsResultHandler) {
    }
}
