//
//  DateTitleView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/15/24.
//

import SwiftUI

struct DateTitleView: View {
    // TODO: String으로 바꿔서 처리하기
    var date: Date

    var body: some View {
        VStack {
            HStack (alignment: .bottom) {
                Text(date, formatter: DateManager.monthDayFormatter)
                    .font(.custom("ShipporiMincho-SemiBold", size: 34))
                    .foregroundStyle(Color("TextColor"))
                Spacer()
            }// HStack
            HStack {
                Text(date, formatter: DateManager.yearFormatter)
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
