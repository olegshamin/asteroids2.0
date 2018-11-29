//
//  Dictionary+Mapping.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 29/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

extension Dictionary where Key: CustomStringConvertible {
    func mapField<T>(withKey key: Key) throws -> T {
        guard let mappedField = self[key] else {
            throw MapperError.valueMissing(forKey: key.description)
        }
        guard let mappedFieldOfType = mappedField as? T else {
            throw MapperError.typeMismatch(
                forKey: key.description,
                expected: T.self,
                got: type(of: mappedField)
            )
        }
        return mappedFieldOfType
    }

    func mapOptionalField<T>(withKey key: Key) -> T? {
        return self[key] as? T
    }
}
