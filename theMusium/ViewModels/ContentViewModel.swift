//
//  ContentViewModel.swift
//  theMusium
//
//  Created by sseungwonnn on 4/16/24.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    /// Key: Date Format: YYYY MMMM d
//    @Published var dailyMuscis: [String: DailyMusic] = [
//        "2024 April 1": DailyMusic(date: "2024 Arpil 1", music: Music(title: "Nowitzki", artist: "Beenzino", cover: "Nowitzki"), caption: "Best Album of 2023"),
//        "2024 April 2": DailyMusic(date: "2024 Arpil 2", music: Music(title: "Chocolate", artist: "the 1975", cover: "the1975"), caption: "I'm Hungry"),
//        "2024 April 3": DailyMusic(date: "2024 Arpil 3", music: Music(title: "Ginny", artist: "Sylo Nozra", cover: "Ginny"), caption: "Shout Out to Snooq"),
//        
//        "2024 April 4": DailyMusic(date: "2024 Arpil 4", music: Music(title: "", artist: "실리카겔", cover: "Realize"), caption: "Shout Out to Namudi"),
//        "2024 April 6": DailyMusic(date: "2024 Arpil 6", music: Music(title: "Don't look back in anger", artist: "Oasis", cover: "DontLookBackInAnger"), caption: "I'm Hungry"),
//        "2024 April 7": DailyMusic(date: "2024 Arpil 7", music: Music(title: "Bitter", artist: "Palace", cover: "Bitter"), caption: "Shout Out to Milou"),
//        
//        "2024 April 8": DailyMusic(date: "2024 Arpil 8", music: Music(title: "Chocolate", artist: "the 1975", cover: "the1975"), caption: "I'm Hungry"),
//        "2024 April 9": DailyMusic(date: "2024 Arpil 9", music: Music(title: "Ginny", artist: "Sylo Nozra", cover: "Ginny"), caption: "Shout Out to Snooq"),
//        "2024 April 10": DailyMusic(date: "2024 Arpil 10", music: Music(title: "", artist: "실리카겔", cover: "Realize"), caption: "Shout Out to Namudi"),
//        "2024 April 11": DailyMusic(date: "2024 Arpil 11", music: Music(title: "Don't look back in anger", artist: "Oasis", cover: "DontLookBackInAnger"), caption: "I'm Hungry"),
//        "2024 April 12": DailyMusic(date: "2024 Arpil 12", music: Music(title: "Bitter", artist: "Palace", cover: "Bitter"), caption: "Shout Out to Milou"),
//        "2024 April 13": DailyMusic(date: "2024 Arpil 13", music: Music(title: "Nowitzki", artist: "Beenzino", cover: "Nowitzki"), caption: "Best Album of 2023"),
//        
//        "2024 April 14": DailyMusic(date: "2024 Arpil 14", music: Music(title: "Chocolate", artist: "the 1975", cover: "1975_1"), caption: "I'm Hungry"),
//        "2024 April 15": DailyMusic(date: "2024 Arpil 15", music: Music(title: "Bitter", artist: "Palace", cover: "Bitter"), caption: "Shout Out to Milou"),
//        "2024 April 16": DailyMusic(date: "2024 Arpil 16", music: Music(title: "Realize", artist: "실리카겔", cover: "Realize"), caption: "Shout Out to Namudi"),
//        
//        "2024 April 17": DailyMusic(date: "2024 Arpil 17", music: Music(title: "Don't look back in anger", artist: "Oasis", cover: "DontLookBackInAnger"), caption: "I'm Hungry"),
//        "2024 April 18": DailyMusic(date: "2024 Arpil 18", music: Music(title: "Bitter", artist: "Palace", cover: "Bitter"), caption: "Shout Out to Milou"),
//    ]
    
    @Published var dailyMusics: [DailyMusic] = []
    
    func isAdded(selectedDate: Date) -> Bool {
        return dailyMusics.contains { dailyMusic in
            var result = (dailyMusic.date == selectedDate ? true : false)
            return result
        }
        
//        return dailyMusics.contains(DateManager.generalFormatter.string(from: selectedDate))
    }
}
