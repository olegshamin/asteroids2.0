//
//  OrbitalClass.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 27/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct OrbitClass {

    // MARK: Properties

    let type: String
    let range: String
    let descr: String

    // MARK: Initialization

    init(
        type: String,
        range: String,
        descr: String
        ) {
        self.type = type
        self.range = range
        self.descr = descr
    }
}

extension OrbitClass: Equatable {
    static func == (lhs: OrbitClass, rhs: OrbitClass) -> Bool {
        return lhs.type == rhs.type &&
            lhs.range == rhs.range &&
            lhs.descr == rhs.descr
    }
}
