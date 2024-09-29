//
//  TodaysBread.swift
//  BOOKBBANG
//
//  Created by Jerrie on 9/23/24.
//

import SwiftUI

//struct TodaysBread: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: Phrase.entity(), sortDescriptors: [])
//    private var phrases: FetchedResults<Phrase>
//    
//    //@State var todaysBread: Phrase?
//    
//    @FetchRequest(entity: TodayBread.entity(), sortDescriptors: [])
//    private var todayBread: FetchedResults<TodayBread>
//    
//    var body: some View {
//        VStack {
//            if let phrase = todaysBread {
//                PhraseCard(display: .todaysBread, phrase: phrase)
//                    .padding(.top, 2)
//            } else {
//                HStack {
//                    Text("새로운 빵을 등록하고\n매일 추천 빵을 받아보세요!")
//                        .font(.bookk15)
//                        .lineSpacing(15)
//                        .foregroundStyle(.typo80)
//                    
//                    Spacer()
//                    Image(.congratulatoryBread)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 150)
//                }
//                .padding(.leading, 35)
//                .padding(.vertical)
//                .background(.backDarker)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .overlay {
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(.typo25)
//                }
//            }
//        }
//        .onAppear {
//            let newTodayBread = TodayBread(context: viewContext)
//            newTodayBread.isOpened = false
//            newTodayBread.date = Date()
//            newTodayBread.phrase = phrases.randomElement()
//            
////            todaysBread = phrases.randomElement()
//        }
//        
//    }
//    func checkDate() {
//        let current = Calendar.current
//        
//        if current.isDateInToday(todayBread[0].date ?? Date()) {
//            
//        }
//    }
//}
//
//#Preview {
//    TodaysBread()
//}
