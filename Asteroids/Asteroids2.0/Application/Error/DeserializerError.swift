//
//  DeserializerError.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

enum DeserializerError: Error, LocalizedError {
    case expectedJSONObject
    case expectedJSONArray

    public var errorDescription: String? {
        switch self {
        case .expectedJSONArray:
            return NSLocalizedString("Invalid response from server. Expected JSON array", comment: "")
        case .expectedJSONObject:
            return NSLocalizedString("Invalid response from server. Expected JSON array", comment: "")
        }
    }
}
