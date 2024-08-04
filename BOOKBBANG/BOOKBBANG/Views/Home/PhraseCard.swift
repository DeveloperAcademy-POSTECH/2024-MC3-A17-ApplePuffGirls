//
//  PhraseCard.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//
// 하나의 구절을 보여주는 카드입니다.

import SwiftUI

struct PhraseCard: View {
    enum displayCardAt {
        case todaysBread // 오늘의 빵
        case detailBook // 책 상세정보의 구절 리스트
        case detailPhrase // 구절 상세정보
        case detailClip // 클립 상세정보의 구절 리스트
        case addPhrase // 새로운 구절 추가할 때
    }
    
    var display: displayCardAt = .todaysBread
    
    // dummy data
    let date = Date()
    let title = "당신이 누군가를 죽였다"
    let page = 12
    let phrase = "그리고는, 안고 온 꽃묶음 속에서 가지가 꺾이고 꽃이 일그러진 송이를 골라 발 밑에 버린다. 소녀는 소년이 개울둑에 앉아 있는 걸 아는지 모르는지 그냥 날쌔게 물만 움켜 낸다."
    
    // 날짜 형식 -> 0000년 0월 00일
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        
        return formatter.string(from: Date())
    }
    
    var phraseTop: String? {
        switch display {
        case .todaysBread:
            return "\(dateString)의 추천빵"
        case .detailBook, .addPhrase:
            return nil
        case .detailPhrase:
            return "\(title), \(page)페이지에서"
        case .detailClip:
            return title
        }
    }
    
    var phraseBottom: String? {
        switch display {
        case .todaysBread:
            return "\(title), \(page)페이지에서"
        case .detailBook, .detailPhrase, .detailClip:
            return dateString
        case .addPhrase:
            return nil
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // 구절 위 초록 형광펜 텍스트
            if let phraseTop {
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .foregroundStyle(.greenMain40)
                        //.frame(width: 177, height: 14)
                        .frame(height: 14)
                        .padding(.bottom, -10)
                    Text(phraseTop)
                        .font(.phraseTop)
                        .foregroundStyle(.typo100)
                }
                .fixedSize()
            }
            
            // 구절
            Text(phrase)
                .font(.bookk15)
                .lineSpacing(15)
                .foregroundStyle(.typo80)
                .padding(.top, 7)
                .padding(.bottom, 13)
            
            // 구절 밑 텍스트
            if let phraseBottom {
                Text(phraseBottom)
                    .font(.phraseBottom)
                    .foregroundStyle(.typo50)
            }
            
        }
        .padding(.horizontal, 35)
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backDarker)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.typo25)
            
        )
        
    }
    
    
}

#Preview {
    ScrollView{
        PhraseCard()
            .padding(.horizontal,2)
    }
}
