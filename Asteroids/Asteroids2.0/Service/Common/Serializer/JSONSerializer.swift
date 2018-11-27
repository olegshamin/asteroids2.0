//
//  JSONSerializer.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

final class JSONSerializer: Serializer {

    // MARK: Private Properties

    private let encoder: JSONEncoder

    // MARK: Properties

    init(encoder: JSONEncoder = JSONEncoder()) {
        self.encoder = encoder
    }

    // MARK: Serializer

    func serialize<T: Encodable>(_ encodable: T) throws -> Data {
        return try JSONEncoder().encode(encodable)
    }
}
