//
//  Date+Extention.swift
//  Tasks
//
//  Created by saori on 2020/04/02.
//  Copyright © 2020 saori. All rights reserved.
//

import Foundation

private let formatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.timeZone = NSTimeZone.system
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.calendar = Calendar(identifier: .gregorian)
    return formatter
}()

public extension Date {
    // Date → String
    func string(format: String = "yyyy/MM/dd") -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    func elapsedDays(date: Date?) -> Int {
        guard let date = date else { return 0 }
        let elapsedDays = Calendar.current.dateComponents([.day], from: self, to: date).day
        return elapsedDays ?? 0
    }

    // String → Date
    init?(dateString: String, dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") {
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: dateString) else { return nil }
        self = date
    }
}
