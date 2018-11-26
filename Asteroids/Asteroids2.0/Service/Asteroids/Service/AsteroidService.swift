//
//  AsteroidService.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

typealias AsteroidsResult = Result<[Asteroid]>
typealias AsteroidsResultHandler = (AsteroidsResult) -> Void

protocol AsteroidService: Service {
    func asteroids(completion: @escaping AsteroidsResultHandler)
}
