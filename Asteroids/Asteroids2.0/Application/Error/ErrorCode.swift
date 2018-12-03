//
//  ErrorCode.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 03/12/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

enum ErrorCode: Int {
    case over_rate_limit = 429

    func string() -> String {
        switch self {
        case .over_rate_limit: return "OVER_RATE_LIMIT"
        }
    }
}
