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
        asteroidService.asteroids { [weak self] result in
        }
    }
}
