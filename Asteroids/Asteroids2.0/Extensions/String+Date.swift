//
//  String+Date.swift
//  Asteroids2.0
//
//  Created by Oleg Shamin on 25/11/2018.
//  Copyright © 2018 Oleg Shamin. All rights reserved.
//

import Foundation

extension String {
    func convertFromServerFormatToDisplay() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else {
            return nil
        }
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
