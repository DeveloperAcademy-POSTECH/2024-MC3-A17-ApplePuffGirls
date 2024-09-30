//
//  TodaysBread.swift
//  BOOKBBANG
//
//  Created by Jerrie on 9/23/24.
//

import SwiftUI

struct TodaysBread: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Phrase.entity(), sortDescriptors: [])
    private var phrases: FetchedResults<Phrase>
    
    @FetchRequest(entity: TodayBread.entity(), sortDescriptors: [])
    private var todayBread: FetchedResults<TodayBread>
    
    var body: some View {
        VStack {
            if !todayBread.isEmpty {
                ForEach(todayBread) { bread in
                    if let phrase = bread.phrase {
                        if bread.isOpened {
                            PhraseCard(display: .todaysBread, phrase: phrase)
                                .padding(.top, 2)
                        } else {
                            Button {
                                openBread()
                            } label: {
                                    Text("눌러서 오픈 &^^!")
                            }
                        }
                    }
                }
            } else {
                HStack {
                    Text("새로운 빵을 등록하고\n매일 추천 빵을 받아보세요!")
                        .font(.bookk15)
                        .lineSpacing(15)
                        .foregroundStyle(.typo80)
                    
                    Spacer()
                    Image(.congratulatoryBread)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                }
                .padding(.leading, 35)
                .padding(.vertical)
                .background(.backDarker)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.typo25)
                }
            }
        }
        .onAppear {
            if isChanged() {
                for bread in todayBread {
                    viewContext.delete(bread)
                }
                
                let newTodayBread = TodayBread(context: viewContext)
                newTodayBread.isOpened = false
                newTodayBread.date = Date()
                newTodayBread.phrase = phrases.randomElement()
            
                do {
                    try viewContext.save()
                } catch {
                    fatalError("Failed to save context, \(error.localizedDescription)")
                }
            }
        }
        
    }
    func isChanged() -> Bool {
        let calendar = Calendar.current
        var referenceTime: Date
        
        if !todayBread.isEmpty, let breadDate = todayBread[0].date {
            // 만약 breadDate가 9시 이전이면 9시로, 2시 이전이면 2시로 변경, 아니면 다음 날 9시로 변경
            let year = calendar.component(.year, from: breadDate)
            let month = calendar.component(.month, from: breadDate)
            let day = calendar.component(.day, from: breadDate)
            let hour = calendar.component(.hour, from: breadDate)
            
            if hour > 9 {
                referenceTime = Date(y: year, m: month, d: day, h: 9) ?? Date()
            } else if hour > 14 {
                referenceTime = Date(y: year, m: month, d: day, h: 14) ?? Date()
            } else {
                referenceTime = Date(y: year, m: month, d: day+1, h: 9) ?? Date()
            }
            
            if Date() > referenceTime {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
    func openBread() {
        for bread in todayBread {
            bread.isOpened = true
            bread.date = Date()
        }
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
    }
}

#Preview {
    TodaysBread()
}
