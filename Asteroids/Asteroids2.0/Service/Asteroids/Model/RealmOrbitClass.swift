//
//  RealmOrbitClass.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmOrbitClass: Object {

    // MARK: Properties

    @objc dynamic var type: String = ""
    @objc dynamic var range: String = ""
    @objc dynamic var descr: String = ""

    override static func primaryKey() -> String? {
        return #keyPath(RealmOrbitClass.type)
    }

    // MARK: Initialization

    convenience init(
        type: String,
        range: String,
        descr: String
        ) {
        self.init()
        self.type = type
        self.range = range
        self.descr = descr
    }

    // MARK: Equatable

    static func == (lhs: RealmOrbitClass, rhs: RealmOrbitClass) -> Bool {
        return lhs.type == rhs.type &&
            lhs.range == rhs.range &&
            lhs.descr == rhs.descr
    }
}
