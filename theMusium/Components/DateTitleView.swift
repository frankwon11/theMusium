//
//  DateTitleView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/15/24.
//

import SwiftUI

struct DateTitleView: View {
    var date: Date

    var body: some View {
        VStack {
            HStack (alignment: .bottom) {
                Text(date.monthDayFormat)
                    .font(.custom("ShipporiMincho-SemiBold", size: 34))
                    .foregroundStyle(Color("TextColor"))
                Spacer()
            }// HStack
            HStack {
                Text(date.yearFormat)
                    .font(.custom("ShipporiMincho-SemiBold", size: 30))
                    .foregroundStyle(Color("CaptionColor"))
                Spacer()
            }
            .padding(.top, -30)
        }// VStack
        .padding()
    }
}

#Preview {
    DateTitleView(date: .now)
}
