//
//  DateManager.swift
//  theMusium
//
//  Created by sseungwonnn on 4/16/24.
//

import SwiftUI

class DateManager {
    // 년도; 2024
    static let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
//        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
    
    // 월 일; April 18
    static let monthDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
//        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
    
    
    // 년 월 일; 2024 April 18
    static let generalFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM d"
//        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
    
//    func getSelectedMonth() -> Int {
//        return Calendar.current.dateComponents([.month], from: selectedDate).month!
//    }
//    func getSelectedYear() -> Int {
//        return Calendar.current.dateComponents([.year], from: selectedDate).year!
//    }
//    func getSelectedDay() -> Int {
//        return Calendar.current.dateComponents([.day], from: selectedDate).day!
//    }
    
    static func isSameDate(date: Date, targetDate: Date) -> Bool {
        return generalFormatter.string(from: date) == generalFormatter.string(from: targetDate)
    }
}

extension Date {
    func getMonth() -> Int {
        return Calendar.current.dateComponents([.month], from: self).month!
    }
    func getYear() -> Int {
        return Calendar.current.dateComponents([.year], from: self).year!
    }
    func getDay() -> Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
}
