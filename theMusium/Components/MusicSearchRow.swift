//
//  MusicSearchRow.swift
//  theMusium
//
//  Created by sseungwonnn on 4/16/24.
//

import SwiftUI

struct MusicSearchRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Divider()
                .frame(minHeight: 1)
                .background(Color("TextColor"))
            HStack {
                Image("DontLookBackInAnger")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60,height: 60)
                    .foregroundStyle(Color("SubBackgroundColor"))
                VStack(alignment: .leading) {
                    
                    // TODO: 노래 제목 받아오기
                        Text("Don't look back in anger")
                            .font(.custom("ShipporiMincho-Bold", size: 16))
                            .foregroundStyle(.text)
                            .frame(width: 250, alignment: .leading)
                    // TODO: 노래 가수 받아오기
                        Text("Oasis")
                            .font(.custom("ShipporiMincho-SemiBold", size: 14))
                            .foregroundStyle(.caption)
                            .frame(width: 250, alignment: .leading)
                    
                    Spacer()
                } // VStack
            } // HStack
            Divider()
                .frame(minHeight: 1)
                .background(Color("TextColor"))
        }
        .frame(height: 80)
        .padding(.horizontal)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    MusicSearchRow()
}
