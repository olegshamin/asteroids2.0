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

    // MARK: AsteroidRepository

    func asteroids(with request: AsteroidsRequest, completion: @escaping AsteroidsResultHandler) {
    }
}
