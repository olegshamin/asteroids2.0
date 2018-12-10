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
    let deserializer: Deserializer
    let requestErrorNetworkMapper: RequestErrorNetworkMapper
    private let networkMapper: AsteroidNetworkMapper

    // MARK: Initialization

    init(
        transport: Transport,
        deserializer: Deserializer,
        networkMapper: AsteroidNetworkMapper,
        requestErrorNetworkMapper: RequestErrorNetworkMapper
        ) {
        self.transport = transport
        self.deserializer = deserializer
        self.networkMapper = networkMapper
        self.requestErrorNetworkMapper = requestErrorNetworkMapper
    }

    // MARK: AsteroidRepository

    func asteroids(with request: AsteroidsRequest,
                   completion: @escaping AsteroidsResultHandler) {
        transport.perform(request: request) { [weak self] result in
            self?.handle(asteroidsResult: result, completion: completion)
        }
    }

    func create(_ asteroids: [Asteroid],
                completion: @escaping VoidResultHandler) {
        assertionFailure("Not implemented")
    }

    // MARK: Private helpers

    private func handle(
        asteroidsResult result: TransportResponseResult,
        completion: @escaping AsteroidsResultHandler
        ) {
        handle(transportResponseResult: result, completion: completion) { data in
            let result = Result(attempt: { try parseAsteroids(data: data) })
            handle(result: result, completion: completion)
        }
    }

    // MARK: Parsing helpers

    private func parseAsteroids(
        data: Data
        ) throws -> [Asteroid] {
        var result: [Asteroid] = []
        let responseDictionary = try deserializer.deserialize(data: data)
        let daysDictionary: ModelDictionary = try responseDictionary.mapField(withKey: ServerField.near_earth_objects)

        for (_, asteroids) in daysDictionary {
            guard let asteroids = asteroids as? [ModelDictionary] else {
                return result
            }
            let models = try asteroids.map(networkMapper.map)
            result.append(contentsOf: models)
        }

        return result
    }
}
