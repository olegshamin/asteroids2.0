//
//  LocalStoreService.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol LocalStoreService {
    func value<Value>(for key: StoreKey<Value>) -> Value?
    func set<Value>(value: Value, for key: StoreKey<Value>)
    func delete<Value>(for key: StoreKey<Value>)
}

final class LocalStoreServiceImpl: LocalStoreService {

    // MARK: Properties

    let userDefaults: UserDefaults

    // MARK: Initialization

    init(
        userDefaults: UserDefaults
        ) {
        self.userDefaults = userDefaults
    }

    // MARK: LocalStoreService

    func value<Value>(for key: StoreKey<Value>) -> Value? {
        return userDefaults.value(forKey: key.rawValue) as? Value
    }

    func set<Value>(value: Value, for key: StoreKey<Value>) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func delete<Value>(for key: StoreKey<Value>) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
