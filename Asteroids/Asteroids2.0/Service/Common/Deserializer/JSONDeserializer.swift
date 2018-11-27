//
//  JSONDeserializer.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

final class JSONDeserializer: Deserializer {
    func deserialize(data: Data) throws -> ModelDictionary {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let modelDictionary = json as? ModelDictionary else {
            throw DeserializerError.expectedJSONObject
        }
        return modelDictionary
    }

    func deserializeArray(data: Data) throws -> [ModelDictionary] {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionaries = json as? [ModelDictionary] else {
            throw DeserializerError.expectedJSONArray
        }
        return dictionaries
    }
}
