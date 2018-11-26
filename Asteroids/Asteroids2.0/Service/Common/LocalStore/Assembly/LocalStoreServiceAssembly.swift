//
//  LocalStoreServiceAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol LocalStoreServiceAssembly {
    func service() -> LocalStoreService
}

final class LocalStoreServiceAssemblyImpl: ServiceAssembly, LocalStoreServiceAssembly {

    // MARK: LocalStoreServiceAssembly

    func service() -> LocalStoreService {
        return LocalStoreServiceImpl(userDefaults: userDefaults())
    }
}
