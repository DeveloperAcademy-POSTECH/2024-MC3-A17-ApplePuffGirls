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
                                VStack(spacing: 40) {
                                    Image(.todaysBreadCover)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 355)
                                    Text("터치해서 오늘의 추천빵을 확인해보세요")
                                        .font(.phraseTop)
                                        .foregroundStyle(.typo80)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.backDarker)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.typo25)
                                }
                            }
                        }
                    } else {
                        //
                        VStack {
                            Image(.todaysBreadCover2)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                            
                            Text("빵을 추가해보세요!")
                                .font(.phraseTop)
                                .foregroundStyle(.typo80)
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.backDarker)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.typo25)
                        }
                    }
                    //
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
            let year = calendar.component(.year, from: breadDate)
            let month = calendar.component(.month, from: breadDate)
            let day = calendar.component(.day, from: breadDate)
            let hour = calendar.component(.hour, from: breadDate)
            
            // 만약 breadDate가 9시 이전이면 9시로, 6시 이전이면 6시로 변경, 아니면 다음 날 9시로 변경
            if hour > 9 {
                referenceTime = Date(y: year, m: month, d: day, h: 9) ?? Date()
            } else if hour > 18 {
                referenceTime = Date(y: year, m: month, d: day, h: 18) ?? Date()
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
