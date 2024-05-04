//
//  ContentView.swift
//  theMusium
//
//  Created by sseungwonnn on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentVM: ContentViewModel = ContentViewModel()
    
    @State var selectedDate = Date.now // 선택한 날짜
    @State var displayedDate = Date.now // 화면에 보이는 날짜
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background).ignoresSafeArea()
                
                VStack {
                    titleView
                    
                    DottedLine()
                    
                    MusicCalenderView(
                        month: Date.now,
                        selectedDate: $selectedDate,
                        displayedYear: $displayedDate
                    )
                    .environmentObject(contentVM)
                    
                    DottedLine()
                    
                    selectedDateRow
                        .padding(.bottom, -2)
                    
                    seletedDateMusicRow(selectedDate: selectedDate)
                    Spacer()
                    
//                    addTodayMusicButton(dailyMusics: $contentVM.dailyMuscis)
                    addTodayMusicButton
                } // VStack
            } // ZStack
            // TODO: pathType 정의
            .navigationDestination(for: String.self) { string in
                AddTodayMusicView()
            }
            .navigationDestination(for: DailyMusic.self) { dailyMusic in
                DailyMusicView(
                    selectedDate: selectedDate,
                    dailyMusic: contentVM.findDailyMusic(forDate: selectedDate)!
                )
            }
        } // NavigationStack
    } // body
    
    // MARK: - 타이틀 뷰
    private var titleView: some View {
        VStack(spacing: 0) {
            HStack (alignment: .bottom) {
                Text("the Musium")
                    .font(.custom("ShipporiMincho-SemiBold", size: 34))
                    .foregroundStyle(Color("TextColor"))
                Spacer()
                
                /// info 버튼
                Button(action: {
                    // TODO: 팝업 추가 예정
                }, label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(Color("CaptionColor"))
                })
            }// HStack
            HStack {
                Text(displayedDate.yearFormat)
                    .font(.custom("ShipporiMincho-SemiBold", size: 30))
                    .foregroundStyle(Color("CaptionColor"))
                Spacer()
            }
            
        }// VStack
        .padding()
    }
    
    // MARK: - 선택한 날짜
    private var selectedDateRow: some View {
        HStack {
            Text(selectedDate.monthDayFormat)
                .font(.custom("ShipporiMincho-SemiBold", size: 20))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    // MARK: - 하단의 오늘의 음악 추가 버튼
    private var addTodayMusicButton: some View {
        NavigationLink(value: "add today's music") {
            AddTodayMusicButtonLabel()
        }
        // TODO: 색 변경 및 비활성화 추가
    }
    
    
    // MARK: - 중단의 선택한 날의 음악 정보 뷰
    @ViewBuilder
    func seletedDateMusicRow(selectedDate: Date) -> some View {
        let isAdded: Bool = contentVM.isAdded(selectedDate: selectedDate)
        
        if isAdded {
            let selectedDailyMusic: DailyMusic = contentVM.findDailyMusic(forDate: selectedDate)!
            
            NavigationLink(value:
                            selectedDailyMusic) {
                HStack {
                    Image(selectedDailyMusic.music.cover)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100,height: 100)
                        .foregroundStyle(.white)
                    VStack(alignment: .leading) {
                        Divider()
                            .frame(minHeight: 1)
                            .background(Color("TextColor"))
                        
                        /// 제목
                        Text(selectedDailyMusic.music.title)
                            .font(.custom("ShipporiMincho-SemiBold", size: 18))
                            .foregroundStyle(Color("TextColor"))
                            .frame(width: 240, alignment: .leading)
                        
                        /// 가수
                        Text(selectedDailyMusic.music.artist)
                            .font(.custom("ShipporiMincho-SemiBold", size: 16))
                            .foregroundStyle(Color("CaptionColor"))
                            .frame(width: 240, alignment: .leading)
                        
                        Spacer()
                        
                        Divider()
                            .frame(minHeight: 1)
                            .background(Color("TextColor"))
                    }
                } // HStack
                .frame(height: 100)
                .padding(.horizontal)
            }
        } else {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(height: 100)
        }
    }
    
}


#Preview {
    ContentView()
        .environmentObject(ContentViewModel())
}

//
//import SwiftUI
//import SwiftData
//
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
