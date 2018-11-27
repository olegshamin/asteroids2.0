//
//  Deserializer.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Protocol for deserializing binary data to [String: Any] dictionary.
/// Example: JSONDeserializer, XMLDeserializer etc.
protocol Deserializer {
    func deserialize(data: Data) throws -> ModelDictionary
    func deserializeArray(data: Data) throws -> [ModelDictionary]
}
