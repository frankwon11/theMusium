//
//  AddTodayMusicButtonLabel.swift
//  theMusium
//
//  Created by sseungwonnn on 4/14/24.
//

import SwiftUI

struct AddTodayMusicButtonLabel: View {
    // TODO: 색 변경 및 비활성화 추가
    var body: some View {
        HStack {
            Spacer()
            Text("Add Today's Music")
                .font(.custom("ShipporiMincho-ExtraBold", size: 18))
                .foregroundStyle(Color("BackgroundColor"))
            Spacer()
        }
        .frame(height: 60)
        .background(Color("TextColor"))
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .padding(.horizontal)
    }
}

#Preview {
    AddTodayMusicButtonLabel()
}
