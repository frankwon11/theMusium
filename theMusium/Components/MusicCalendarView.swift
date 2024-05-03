//
//  MusicCalandarView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/13/24.
//

import SwiftUI

struct MusicCalenderView: View {
    @State var month: Date
    @State var offset: CGSize = CGSize()
    @Binding var selectedDate: Date // 선택한 날짜
    @Binding var displayedYear: Date // 화면에 보이는 날짜
    
    @Binding var dailyMusics: [String: DailyMusic]
    
    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
        .padding([.leading, .bottom, .trailing])
        .background(Color("BackgroundColor"))
    }
    
    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            HStack {
                Button(action: {
                    changeMonth(by: -1)
                }, label: {
                    Image(systemName: "chevron.compact.left")
                        .foregroundStyle(Color("TextColor"))
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                
                Text(month, formatter: Self.dateFormatter)
                    .font(.custom("ShipporiMincho-SemiBold", size: 16))
                    .foregroundStyle(Color("TextColor"))
                    .padding()
                
                Spacer()
                Button(action: {
                    changeMonth(by: 1)
                }, label: {
                    Image(systemName: "chevron.compact.right")
                        .foregroundStyle(Color("TextColor"))
                })
                .buttonStyle(PlainButtonStyle())
            }
            
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .font(.custom("ShipporiMincho-Regular", size: 14))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
    
    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday { // 지난달
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else { // 이번 달
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        
                        // 클릭했는지
                        let isSelected: Bool = DateManager.isSameDate(date: date, targetDate: selectedDate)
                                                
                        // 이미 추가했는지
                        let isAdded: Bool = dailyMusics.keys.contains(DateManager.generalFormatter.string(from: date))

                        CellView(day: day, isSelected: isSelected, isAdded: isAdded, date: date)
                            .onTapGesture {
                                selectedDate = date
                                print(DateManager.generalFormatter.string(from: selectedDate))
                            }
                    }
                }
            }
        } // VStack
    }
}

// MARK: - 일자 셀 뷰
private struct CellView: View {
    @EnvironmentObject var contentVM: ContentViewModel
    
    var day: Int
    var isSelected: Bool
    var isAdded: Bool
    var date: Date
    
    init(day: Int, isSelected: Bool, isAdded: Bool, date: Date) {
        self.day = day
        self.isSelected = isSelected
        self.isAdded = isAdded
        self.date = date
    }
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .center)){
            if isAdded {
                RoundedRectangle(cornerRadius: 6)
                    .size(CGSize(width: 40, height: 40))
                    .foregroundColor(.tint)
                    .opacity(isSelected ? 1.0 : 0.4)
                
                Image(contentVM.dailyMuscis[DateManager.generalFormatter.string(from: date)]?.music.cover ?? "DontLookBackInAnger")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36)
                    .foregroundColor(.black)
                    .opacity(isSelected ? 1.0 : 0.4)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            Text(String(day))
                .font(isSelected ? .custom("ShipporiMincho-ExtraBold", size: 16) : .custom("ShipporiMincho-Regular", size: 16))
                .foregroundColor(Color("TextColor"))
                .padding(.bottom, 4)
            
        }
        .frame(width: 40, height: 40)
        .padding([.top,.bottom], 0)
    }
}

// MARK: - 내부 메서드
private extension MusicCalenderView {
    /// 특정 해당 날짜
    private func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
    
    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
            self.displayedYear = newMonth
        }
    }
}

// MARK: - Static 프로퍼티
extension MusicCalenderView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
    
    static var weekdaySymbols = Calendar.current.shortWeekdaySymbols
}



#Preview {
    MusicCalenderView(month: Date.now, selectedDate: .constant(Date.now), displayedYear: .constant(Date.now), dailyMusics: .constant(["2024 April 17": DailyMusic(date:"2024 April 18", music: Music(title: "Don't look back in anger", artist: "Oasis", cover: "DontLookBackInAnger"), caption: "I'm Sleepy")])).environmentObject(ContentViewModel())
}
