//
//  HostServiceAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol HostServiceAssembly {
    func service() -> HostService
}

final class HostServiceAssemblyImpl: ServiceAssembly, HostServiceAssembly {

    // MARK: Private properties

    private let localStoreServiceAssembly: LocalStoreServiceAssembly

    // MARK: Initialization

    init(
        localStoreServiceAssembly: LocalStoreServiceAssembly
        ) {
        self.localStoreServiceAssembly = localStoreServiceAssembly
    }

    // MARK: HostServiceAssembly

    func service() -> HostService {
        return HostServiceImpl(localStoreService: localStoreServiceAssembly.service())
    }
}
