//
//  Repository.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

/// Base protocol for repositories.
/// Repositories are objects that manage data from different sources (network, database etc.)
protocol Repository: class {}

// Contains helpers for handling completion blocks to avoid code duplication
// and so that all completion blocks are handled in one place
extension Repository {
    func handle<T>(result: Result<T>, completion: @escaping (Result<T>) -> Void) {
        completion(result)
    }

    func handle<T>(success value: T, completion: @escaping (Result<T>) -> Void) {
        completion(.success(value))
    }

    func handle<T>(error: Error, completion: @escaping (Result<T>) -> Void) {
        completion(.failure(error))
    }
}
