//
//  Result.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

typealias ResultHandler<T> = (Result<T>) -> Void
typealias VoidResult = Result<Void>
typealias VoidResultHandler = (VoidResult) -> Void

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

extension Result {

    init(attempt block: () throws -> Value) {
        do {
            self = .success(try block())
        } catch {
            self = .failure(error)
        }
    }

    func dematerialize() throws -> Value {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }

    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }

    var isSuccess: Bool {
        if case .success = self {
            return true
        } else {
            return false
        }
    }
}
