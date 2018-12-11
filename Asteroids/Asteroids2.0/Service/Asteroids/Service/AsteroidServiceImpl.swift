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

    func asteroids(with request: AsteroidsRequest,
                   completion: @escaping AsteroidsResultHandler) {
        self.scheduler.doInBg { [weak self] in
            guard let self = self else {
                return
            }
            self.networkRepository.asteroids(with: request, completion: { result in
                self.handle(asteroidsNetworkResult: result, request: request, completion: completion)
            })
        }
    }

    // MARK: Private handlers

    private func handle(
        asteroidsNetworkResult result: AsteroidsResult,
        request: AsteroidsRequest,
        completion: @escaping AsteroidsResultHandler
        ) {
        switch result {
        case .success(let asteroids):

            databaseRepository.create(asteroids) { _ in }
            handle(result: result, scheduler: scheduler, completion: completion)

        case .failure(let error):
            handle(networkError: error, scheduler: scheduler, completion: completion) {
                databaseRepository.asteroids(with: request, completion: { [weak self] result in
                    self?.handle(asteroidsDatabaseResult: result, networkError: error, completion: completion)
                })
            }
        }
    }

    private func handle(
        asteroidsDatabaseResult result: AsteroidsResult,
        networkError: Error,
        completion: @escaping AsteroidsResultHandler
        ) {
        // TODO: Log database error
        guard case .success = result else {
            handle(error: networkError, scheduler: scheduler, completion: completion)
            return
        }
        handle(result: result, scheduler: scheduler, completion: completion)
    }
}
