//
//  Date+Request.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 25/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

extension Date {
    func convertToRequest() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
