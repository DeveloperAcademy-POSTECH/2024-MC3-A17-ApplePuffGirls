//
//  PhraseCard.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//
// 하나의 구절을 보여주는 카드입니다.

import SwiftUI

struct PhraseCard: View {
    var body: some View {
        
        // dummy data
        let date = Date()
        let title = "당신이 누군가를 죽였다"
        let page = 12
        let phrase = "그리고는, 안고 온 꽃묶음 속에서 가지가 꺾이고 꽃이 일그러진 송이를 골라 발 밑에 버린다. 소녀는 소년이 개울둑에 앉아 있는 걸 아는지 모르는지 그냥 날쌔게 물만 움켜 낸다."
        
        VStack(alignment: .leading) {
            
            // (날짜)의 추천빵
            ZStack(alignment: .trailing) {
                Rectangle()
                    .foregroundStyle(.greenMain40)
                    .frame(width: 177, height: 14)
                    .padding(.bottom, -10)
                
                Text("\(dateToString(date))의 추천빵")
                    .font(.phraseTop)
                    .foregroundStyle(.typo100)
            }
            
            // 구절
            Text(phrase)
                .font(.bookk15)
                .lineSpacing(15)
                .foregroundStyle(.typo80)
                .padding(.top, 7)
                .padding(.bottom, 13)
            
            // 책 제목, 페이지
            Text("\(title), \(page)페이지에서")
                .font(.phraseBottom)
                .foregroundStyle(.typo50)
        }
        .padding(.horizontal, 35)
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
    }
    
    // 날짜를 문자열 형식으로 보여줍니다.
    func dateToString(_ date: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        if let year = components.year, let month = components.month, let day = components.day {
            return "\(year)년 \(month)월 \(day)일"
        } else {
            return ""
        }
    }
}

#Preview {
    PhraseCard()
        .padding(.horizontal,2)
}
