//
//  ListInteractor.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol ListBusinessLogic {
    func asteroids(request: List.Asteroids.Request)
}

protocol ListDataStore {}

final class ListInteractor: ListBusinessLogic, ListDataStore {

    // MARK: Private properties

    private let presenter: ListPresentationLogic
    private let asteroidService: AsteroidService
    private var currentDate = Date()

    // MARK: ListDataStore

    // MARK: Initialization

    init(
        presenter: ListPresentationLogic,
        asteroidService: AsteroidService
        ) {
        self.presenter = presenter
        self.asteroidService = asteroidService
    }

    // MARK: ListBusinessLogic

    func asteroids(request: List.Asteroids.Request) {

        let request = AsteroidsRequest(startDate: currentDate, endDate: currentDate.adding(-7))

        asteroidService.asteroids(with: request) { [weak self] result in
            self?.handle(asteroidsResult: result)
        }
    }

    // MARK: Private handlers

    private func handle(
        asteroidsResult result: AsteroidsResult
        ) {

        switch result {
        case .success(let asteroids):

            var sortedAsteroids = asteroids
            sortedAsteroids.sort(by: { $0.date > $1.date })

            let response = List.Asteroids.Response.Success(asteroids: sortedAsteroids)
            currentDate = currentDate.adding(-8)
            presenter.presentAsteroidsSuccess(response: response)
        case .failure(let error):
            let response = List.Asteroids.Response.Failure(error: error)
            presenter.presentAsteroidsFailure(response: response)
        }
    }
}
