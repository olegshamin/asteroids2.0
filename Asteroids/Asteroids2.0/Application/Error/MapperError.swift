//
//  MapperError.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 29/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

public enum MapperError: Error, LocalizedError {
    case valueMissing(forKey: String)
    case typeMismatch(forKey: String, expected: Any.Type, got: Any.Type)

    public var errorDescription: String? {
        let message: String
        switch self {
        case .valueMissing(let key):
            message = .localizedStringWithFormat("Value missing for key '%@'", key)
        case .typeMismatch(let key, let expected, let got):
            let formatString = "Value mismatch for key '%@'. Expected: '%@'. Got '%@'"
            message = .localizedStringWithFormat(formatString, key, "\(expected)", "\(got)")
        }
        return .localizedStringWithFormat("Mapper error. %@", message)

    }
}
