//
//  Date+Display.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 25/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

extension Date {
    func convertToDisplayString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full

        let calendar = Calendar.current
        if calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "")
        }

        return formatter.string(from: self)
    }
}
