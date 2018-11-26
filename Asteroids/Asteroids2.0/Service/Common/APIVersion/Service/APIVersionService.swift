//
//  APIVersionService.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

public protocol APIVersionService {
    func setApiVersionNumber(_ apiVersionNumber: Int)
    func apiVersionNumber() -> Int
}

final class APIVersionServiceImpl: APIVersionService {

    // MARK: Private properties

    private let localStoreService: LocalStoreService

    // MARK: Initialization

    init(
        localStoreService: LocalStoreService
        ) {
        self.localStoreService = localStoreService
    }

    // MARK: APIVersionService

    func setApiVersionNumber(_ apiVersionNumber: Int) {
        localStoreService.set(value: apiVersionNumber, for: .apiVersion)
    }

    func apiVersionNumber() -> Int {
        guard let version = localStoreService.value(for: .apiVersion) else {
            return 1
        }
        return version
    }
}
