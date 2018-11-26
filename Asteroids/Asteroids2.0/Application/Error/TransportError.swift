//
//  TransportError.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

public enum TransportError: Error, LocalizedError {
    case requestFailed(underlyingError: Error)
    case invalidResponse
    case couldNotEncodeCredentials
    case internalServerError

    public var errorDescription: String? {
        switch self {
        case .requestFailed(let underlyingError):
            return .localizedStringWithFormat("Network request failed. %@", underlyingError.localizedDescription)
        case .invalidResponse:
            return NSLocalizedString("Invalid response from server", comment: "")
        case .couldNotEncodeCredentials:
            return NSLocalizedString("Could not encode credentials", comment: "")
        case .internalServerError:
            return NSLocalizedString("Internal server error", comment: "")
        }
    }
}
