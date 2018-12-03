//
//  RequestError.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct RequestError: Error, LocalizedError {

    // MARK: Properties

    var message: String
    var code: String

    // MARK: Initializers

    public init(error: NSError) {
        message = error.description
        code    = "\(error.code)"
    }

    public init(
        message: String,
        code: String
        ) {
        self.message = message
        self.code = code
    }

    // MARK: LocalizedError

    public var errorDescription: String? {
        return message
    }
}
