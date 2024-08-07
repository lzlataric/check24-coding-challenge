//
//  Int+Ext.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import Foundation

extension Int {
    func toFormattedDateString(format: String = "dd.MM.yyyy") -> String {
        let timeInterval = TimeInterval(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
