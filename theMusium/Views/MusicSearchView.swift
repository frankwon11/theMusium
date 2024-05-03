//
//  MusicSearchView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/14/24.
//

import SwiftUI


struct MusicSearchView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var query: String = ""
    @Binding var selectedMusic: Music?
    
    var body: some View {
        NavigationView {
            ScrollView {
                if !query.isEmpty {
                    ZStack {
                        Color(.background).ignoresSafeArea()
                        VStack {
                            ForEach(1..<6) { _ in
                                MusicSearchRow()
                                    .onTapGesture {
                                        // TODO: 음악 검색 추가
                                        selectedMusic = Music(title: "Don't look back in anger", artist: "Oasis", cover: "DontLookBackInAnger")
                                        
                                        dismiss()
                                    }
                                    
                            }
                        }
                    }
                } else {
                    HStack {
                        Text("Listen,\nThink,\nAnd Choose Today's Music ")
                            .font(.custom("ShipporiMincho-Bold", size: 34))
                            .foregroundStyle(Color("TextColor"))
                        Spacer()
                    }
                    .padding(.leading)
                }
            }
            .background(Color("BackgroundColor"))
            .padding(.top, 30)
            .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("entrance") {
                        // TODO: 음악 선택 로직 구현
                        dismiss()
                    }
                    .font(.custom("ShipporiMincho-SemiBold", size: 18))
                    .foregroundStyle(Color("TextColor"))
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("way out") {
                        dismiss()
                    }
                    .font(.custom("ShipporiMincho-SemiBold", size: 18))
                    .foregroundStyle(Color("CaptionColor"))
                    
                }
            } // toolbar
            .background(Color("BackgroundColor"))
        }
    }
}


#Preview {
    MusicSearchView(selectedMusic: .constant(Music(title: "", artist: "", cover: "")))
}
