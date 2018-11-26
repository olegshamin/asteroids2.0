//
//  APIVersionServiceAssembly.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

protocol APIVersionServiceAssembly {
    func service() -> APIVersionService
}

final class APIVersionServiceAssemblyImpl: ServiceAssembly, APIVersionServiceAssembly {

    // MARK: Private properties

    private let localStoreServiceAssembly: LocalStoreServiceAssembly

    // MARK: Initialization

    init(
        localStoreServiceAssembly: LocalStoreServiceAssembly
        ) {
        self.localStoreServiceAssembly = localStoreServiceAssembly
    }

    // MARK: APIVersionServiceAssembly

    func service() -> APIVersionService {
        return APIVersionServiceImpl(localStoreService: localStoreServiceAssembly.service())
    }
}
