//
//  DateManager.swift
//  theMusium
//
//  Created by sseungwonnn on 4/16/24.
//

import SwiftUI

extension Date {
    /// Date 타입을 "2024 April 18" 형식의 문자열로 반환합니다.
    var dailyMusicFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY MMMM d"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    /// Date 타입을 년도만 골라서 문자열로 반환합니다; 2024
    var yearFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    /// Date 타입을 월(영문)만을 골라서 문자열로 반환합니다; April
    var monthFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    /// Date 타입을 월(영문), 일만을 골라서 문자열로 반환합니다; April 18
    var monthDayFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
//    /// 요일의 심볼을 나타냅니다; Mon
//    var weekdaySymbols = Calendar.current.shortWeekdaySymbols
    
    func isSameDate(targetDate: Date) -> Bool {
        return self.dailyMusicFormat == targetDate.dailyMusicFormat
    }
    
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

//
//class DateManager {
//    // 년도; 2024
//    static let yearFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY"
////        formatter.locale = Locale(identifier: "ko_KR")
//        return formatter
//    }()
//    
//    // 월 일; April 18
//    static let monthDayFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM d"
////        formatter.locale = Locale(identifier: "ko_KR")
//        return formatter
//    }()
//    
//    
////    // 년 월 일; 2024 April 18
////    static let generalFormatter: DateFormatter = {
////        let formatter = DateFormatter()
////        formatter.dateFormat = "YYYY MMMM d"
//////        formatter.locale = Locale(identifier: "ko_KR")
////        return formatter
////    }()
//    
////    static func isSameDate(date: Date, targetDate: Date) -> Bool {
////        return generalFormatter.string(from: date) == generalFormatter.string(from: targetDate)
////    }
//}
