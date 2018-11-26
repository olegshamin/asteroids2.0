//
//  StoreKey.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct StoreKey<Value>: RawRepresentable {
    public typealias RawValue = String

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension StoreKey {

    // Base
    static var apiVersion: StoreKey<Int> { return StoreKey<Int>(rawValue: "apiVersion") }
    static var host: StoreKey<String> { return StoreKey<String>(rawValue: "host") }
}
