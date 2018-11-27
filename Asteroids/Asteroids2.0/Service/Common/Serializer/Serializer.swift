//
//  Serializer.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol Serializer {
    func serialize<T: Encodable>(_ encodable: T) throws -> Data
}
