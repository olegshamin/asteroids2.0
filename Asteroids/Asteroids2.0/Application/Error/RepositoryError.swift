//
//  RepositoryError.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 17/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

public enum RepositoryError: Error, LocalizedError {
    case noObjectWithPrimaryKey(Any, ofType: Any.Type)
    case noObjectWithParameters([String: Any], ofType: Any.Type)

    public var errorDescription: String? {
        switch self {
        case .noObjectWithPrimaryKey(let primaryKey, let type):
            let formatString = "No object in database for primary key '%@' of type '%@'"
            return .localizedStringWithFormat(formatString, "\(primaryKey)", "\(type)")
        case .noObjectWithParameters(let parameters, let type):
            let formatString = "No object in database for parameters '%@' of type '%@'"
            return .localizedStringWithFormat(formatString, "\(parameters)", "\(type)")
        }
    }
}
