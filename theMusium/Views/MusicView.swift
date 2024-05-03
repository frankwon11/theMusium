//
//  MusicView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/15/24.
//

import SwiftUI

struct MusicView: View {
    @State var progress: Double = 0.4
    @State private var showCaption: Bool = true
    @State private var isPlaying: Bool = true
    var selectedDate: Date
    var dailyMusic: DailyMusic
    
    var body: some View {
        VStack {
            DateTitleView(date: selectedDate)
            
            if showCaption {
                Image(dailyMusic.music.cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation {
                            showCaption = false
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.subBackground)
                    .frame(width: 350, height: 350)
                    .padding(.horizontal)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text(dailyMusic.caption)
                                .font(.custom("ShipporiMincho-Bold", size: 24))
                                .foregroundStyle(Color("TextColor"))
                                .frame(width: 300, alignment: .leading)
                            Spacer()
                        }
                        .padding()
                    )
                    .onTapGesture {
                        withAnimation {
                            showCaption = true
                        }
                    }
            }
            
            
            Spacer().frame(height: 20)
            
            HStack (spacing: -10) {
                Text("01:16")
                    .font(.custom("ShipporiMincho-SemiBold", size: 12))
                    .foregroundStyle(Color("CaptionColor"))
                
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .text))
                    .frame(width: 280)
                    .padding(.horizontal)
                
                Text("03:37")
                    .font(.custom("ShipporiMincho-SemiBold", size: 12))
                    .foregroundStyle(Color("CaptionColor"))
            }
            .padding(.horizontal)
            
            HStack {
                VStack (alignment: .leading) {
                    Text(dailyMusic.music.title)
                        .font(.custom("ShipporiMincho-SemiBold", size: 22))
                        .foregroundStyle(Color("TextColor"))
                        .frame(width: 300, alignment: .leading)
                    
                    Text(dailyMusic.music.artist)
                        .font(.custom("ShipporiMincho-SemiBold", size: 18))
                        .foregroundStyle(Color("CaptionColor"))
                        .frame(width: 300, alignment: .leading)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            HStack{
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .foregroundStyle(Color("TintColor"))
                        .frame(width: 20, height: 30)
                })
            }
            .padding(.horizontal)
            
            Spacer().frame(height: 20)
            DottedLine()
            BarcodeShapeView()
                
            Spacer()
        }.background(Color("BackgroundColor"))
    }
}

struct BarcodeShapeView: View {
    // Array that represents the widths of the barcode's bars
    let barWidths: [CGFloat] = [3, 1, 2, 3, 1, 2, 1, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 1, 3, 1, 2, 3, 1, 2, 1, 1, 2, 3, 1, 2, 3, 4, 1, 4, 1, 2, 3, 1, 2, 3, 1, 2, 1, 2, 3, 1, 2, 2, 2, 3, 4, 1, 4, 1, 2, 3, 1, 2, 3, 1, 2, 1, 2, 3, 1, 2, 2, 1, 1]
    
    var body: some View {
        HStack(spacing: 3) {
            ForEach(barWidths, id: \.self) { width in
                Rectangle()
                    .fill(.text) // Bar color
                    .frame(width: width, height: 70) // Width and height of each bar
            }
        }
        .padding()
        
    }
}


#Preview {
    MusicView(selectedDate: Date.now, dailyMusic: DailyMusic(date: "2024 Arpil 17", music: Music(title: "Don't look back in anger", artist: "Oasis", cover: "DontLookBackInAnger"), caption: "I'm Hungry"))
}
