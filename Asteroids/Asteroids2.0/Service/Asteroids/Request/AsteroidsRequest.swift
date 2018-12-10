//
//  AsteroidsRequest.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 18/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

struct AsteroidsRequest: Request {

    // MARK: Properties

    let startDate: String
    let endDate: String
    let startTimeInterval: Double
    let endTimeInterval: Double

    // MARK: Initialization

    init(
        startDate: Date,
        endDate: Date
        ) {
        self.startDate = startDate.convertToRequest()
        self.endDate = endDate.convertToRequest()
        self.startTimeInterval = startDate.timeIntervalSince1970
        self.endTimeInterval = endDate.timeIntervalSince1970
    }

    // MARK: Request

    var path: String {
        return URLString.feed
    }

    var parameters: [String: Any] {
        return [
            ServerField.start_date: startDate,
            ServerField.end_date: endDate,
            ServerField.detailed: true,
            ServerField.api_key: Constants.apiKey
        ]
    }
}
