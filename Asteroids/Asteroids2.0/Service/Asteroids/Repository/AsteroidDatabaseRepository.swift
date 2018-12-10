//
//  AsteroidDatabaseRepository.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

final class AsteroidDatabaseRepository: AsteroidRepository, DatabaseRepository {

    typealias DatabaseModel = RealmAsteroid
    typealias PrimaryKey = String

    // MARK: Private Properties

    private let asteroidDatabaseMapper: AsteroidDatabaseMapper

    // MARK: Initialization

    init(
        asteroidDatabaseMapper: AsteroidDatabaseMapper
        ) {
        self.asteroidDatabaseMapper = asteroidDatabaseMapper
    }

    // MARK: AsteroidRepository

    func asteroids(with request: AsteroidsRequest,
                   completion: @escaping AsteroidsResultHandler) {
        let result = Result { () -> [Asteroid] in
            let filter = NSPredicate(format: "timeInterval <= %lf AND timeInterval >= %lf",
                                     request.startTimeInterval,
                                     request.endTimeInterval)
            return try fetch(filter: filter).map({ try asteroidDatabaseMapper.map($0) })
        }
        completion(result)
    }

    func create(_ asteroids: [Asteroid],
                completion: @escaping VoidResultHandler) {
        let result = Result {
            let databaseModels = try asteroids.map(asteroidDatabaseMapper.map)
            try createOrUpdate(databaseModels: databaseModels)
        }
        completion(result)
    }
}
