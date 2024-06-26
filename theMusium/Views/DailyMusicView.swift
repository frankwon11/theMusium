//
//  MusicView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/15/24.
//

import SwiftUI

struct DailyMusicView: View {
    @State var progress: Double = 0.4
    @State private var showCaption: Bool = false
    @State private var isPlaying: Bool = true
    
    var selectedDate: Date
    // TODO: 수정 동작 추가
    var dailyMusic: DailyMusic
    
    var body: some View {
        VStack {
            // TODO: 수정 동작 추가
            DateTitleView(date: selectedDate)
            
            if showCaption {
                captionView
            } else {
                musicCoverView
            }
            
            Spacer().frame(height: 20)
            
            // TODO: 음악 정보 받아오기
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
                
                // TODO: 재생 동작 추가하기
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
    
    
    // MARK: - 음악 앨범 커버 뷰
    private var musicCoverView: some View {
        Image(dailyMusic.music.cover)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 350, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            .onTapGesture {
                withAnimation {
                    showCaption = true
                }
            }
    }
    
    // MARK: - 캡션 뷰
    private var captionView: some View {
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
                    showCaption = false
                }
            }
    }
}

// TODO: 음악 연결 추가
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
    DailyMusicView(selectedDate: Date.now, dailyMusic: DailyMusic(date: Date.now, music: Music(title: "Don't look back in anger", artist: "Oasis", cover: "DontLookBackInAnger"), caption: "I'm Hungry"))
}
