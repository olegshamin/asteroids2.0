//
//  AsteroidRepository.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol AsteroidRepository {
    func asteroids(with request: AsteroidsRequest, completion: @escaping AsteroidsResultHandler)
    func create(_ asteroids: [Asteroid], completion: @escaping VoidResultHandler)
}
