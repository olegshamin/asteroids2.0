//
//  AsteroidNetworkRepository.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

final class AsteroidNetworkRepository: AsteroidRepository, NetworkRepository {

    // MARK: NetworkRepository

    let transport: Transport

    // MARK: Initialization

    init(
        transport: Transport
        ) {
        self.transport = transport
    }

    // MARK: AsteroidRepository

    func asteroids(with request: AsteroidsRequest, completion: @escaping AsteroidsResultHandler) {
    }
}
