//
//  HostService.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Internal protocol for host management,
protocol HostService {
    func host() -> String
    func setHost(_ host: String)
}

final class HostServiceImpl: HostService {

    // MARK: Private properties

    private let localStoreService: LocalStoreService

    // MARK: Initialization

    init(
        localStoreService: LocalStoreService
        ) {
        self.localStoreService = localStoreService
    }

    // MARK: HostService

    func host() -> String {
        guard let host = localStoreService.value(for: .host) else {
            return Constants.baseURL
        }
        return host
    }

    func setHost(_ host: String) {
        localStoreService.set(value: host, for: .host)
    }
}
