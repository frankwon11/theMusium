//
//  AddTodayMusicView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/13/24.
//

import SwiftUI

struct AddTodayMusicView: View {
//    @EnvironmentObject var contentVM: ContentViewModel
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isFocused: Bool
    
    @State var selectedMusic: Music?
    @State private var caption: String = ""
    @State var showFullScreenCover: Bool = false

    var body: some View {
        VStack {
            DateTitleView(date: Date.now)
            
            subTitleView(subTitle: "Music")
            subTitleCaptionView(subTitleCaption: "Select your music for today")
            
            todayMusicInfo
            Spacer().frame(height: 50)
            
            subTitleView(subTitle: "Caption")
            subTitleCaptionView(subTitleCaption: "Write something about today")
            
            captionView
            Spacer()
            
            DottedLine()
            Spacer().frame(height: 20)
            
            addTodayMusicButton
        }
        .background(Color("BackgroundColor"))
        .fullScreenCover(isPresented: $showFullScreenCover, content: {
            ZStack {
                Color(.background).ignoresSafeArea()
                MusicSearchView(selectedMusic: $selectedMusic)
            }
        })
    }
    
    // MARK: - 오늘의 음악
    private var todayMusicInfo: some View {
        HStack {
            if selectedMusic != nil {
                Image("DontLookBackInAnger")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100,height: 100)
                    .foregroundStyle(.white)
            }
            else {
                Rectangle()
                    .frame(width: 100,height: 100)
                    .foregroundStyle(Color("SubBackgroundColor"))
                    .overlay(Button(action: {
                        showFullScreenCover = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundStyle(Color("CaptionColor"))
                    }))
            }
            
            VStack(alignment: .leading) {
                Divider()
                    .frame(minHeight: 1)
                    .background(Color("TextColor"))

                if let selectedMusic = selectedMusic {
                    Text(selectedMusic.title)
                        .font(.custom("ShipporiMincho-SemiBold", size: 18))
                        .foregroundStyle(Color("TextColor"))
                        .frame(width: 250, alignment: .leading)
                
                    Text(selectedMusic.artist)
                        .font(.custom("ShipporiMincho-SemiBold", size: 16))
                        .foregroundStyle(Color("CaptionColor"))
                        .frame(width: 250, alignment: .leading)
                }
                    
                Spacer()
                
                Divider()
                    .frame(minHeight: 1)
                    .background(Color("TextColor"))
            }
        } // HStack
        .frame(height: 100)
        .padding(.horizontal)
    }
    
    // MARK: - 캡션 입력 뷰
    private var captionView: some View {
        TextEditor(text: $caption)
            .font(.custom("ShipporiMincho-SemiBold", size: 16))
            .foregroundStyle(Color("TextColor"))
            .padding()
            .frame(height: 150)
            .scrollContentBackground(.hidden)
            .background(Color("SubBackgroundColor"))
            .clipShape(RoundedRectangle(cornerRadius: 15)).padding(.horizontal)
            .textInputAutocapitalization(.never)
            .focused($isFocused)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        isFocused = false
                    } label: {
                        Text("Done")
                    }
                    
                }
            }
    }
    
    // MARK: - 하단의 오늘의 음악 추가 버튼
    private var addTodayMusicButton: some View {
        Button(action: {
            // TODO: 색 변경 및 비활성화 추가
            // TODO: 동작 추가
        }, label: {
            AddTodayMusicButtonLabel()
        }) // Button
        
    }
}

// MARK: - 서브 타이틀
@ViewBuilder
func subTitleView(subTitle: String) -> some View {
    HStack {
        Text(subTitle)
            .font(.custom("ShipporiMincho-SemiBold", size: 20))
            .foregroundStyle(Color("TextColor"))
        Spacer()
    }
    .padding(.horizontal)
}

// MARK: - 서브 타이틀 캡션
@ViewBuilder
func subTitleCaptionView(subTitleCaption: String) -> some View {
    HStack {
        Text(subTitleCaption)
            .font(.custom("ShipporiMincho-SemiBold", size: 16))
            .foregroundStyle(Color("CaptionColor"))
        Spacer()
    }
    .padding(.horizontal)
}

#Preview {
    AddTodayMusicView()
}
