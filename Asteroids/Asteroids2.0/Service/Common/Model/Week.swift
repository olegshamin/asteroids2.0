//
//  Week.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 25/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct Week {

    // MARK: Properties

    let startDate: Date
    let endDate: Date

    // MARK: Initialization

    init(
        startDate: Date,
        endDate: Date
        ) {
        self.startDate = startDate
        self.endDate = endDate
    }
}
