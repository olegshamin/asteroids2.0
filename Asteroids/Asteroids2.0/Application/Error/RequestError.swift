//
//  RequestError.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct RequestError: Error, LocalizedError {

    // MARK: Private properties

    private let message: String?
    private let code: Int

    // MARK: Initialization

    init(
        error: NSError
        ) {
        message = error.description
        code    = error.code
    }

    init(
        message: String?,
        code: Int
        ) {
        self.message = message
        self.code = code
    }

    // MARK: LocalizedError

    var errorDescription: String? {
        return message
    }
}

// MARK: - Decodable

extension RequestError: Decodable {

    enum DecodeKeys: String, CodingKey {
        case message = "error_message"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodeKeys.self)
        let message: String = try container.decode(String.self, forKey: .message)
        let code: Int = try container.decode(Int.self, forKey: .code)
        self.init(message: message,
                  code: code)
    }
}
