//
//  DateMusic.swift
//  theMusium
//
//  Created by sseungwonnn on 4/15/24.
//

import SwiftUI

// 한 날짜에 기록된 음악
struct DailyMusic: Hashable, Equatable {
    let date: Date // "YYYY MMMM d"
    var music: Music
    var caption: String
}
