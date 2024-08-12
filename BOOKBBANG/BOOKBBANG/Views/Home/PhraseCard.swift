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
    
    // 날짜 형식 -> 0000년 0월 00일
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        
        return formatter.string(from: phrase.createdDate ?? .now)
    }
    
    var phraseTop: String? {
        switch display {
        case .todaysBread:
            return "\(dateString)의 추천빵"
        case .detailBook, .addPhrase:
            return nil
        case .detailClip, .detailPhrase:
            return phrase.book?.name ?? "No title"
        }
    }
    
    var phraseBottom: String? {
        switch display {
        case .todaysBread:
            if let bookName = phrase.book?.name {
                return "\(bookName)"
            } else {
                return "책 정보가 없거나 페이지 번호가 없습니다."
            }
        case .detailBook, .detailPhrase, .detailClip:
            return dateString
        case .addPhrase:
            return nil
        }
    }
    
    @ObservedObject var phrase: Phrase
    
    var body: some View {
        VStack(alignment: .leading) {
            // 구절 위 초록 형광펜 텍스트
            if let phraseTop = phraseTop {
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .foregroundStyle(.greenMain40)
                        .frame(height: 14)
                        .padding(.bottom, -10)
                    Text(phraseTop)
                        .font(.phraseTop)
                        .foregroundStyle(.typo100)
                }
                .fixedSize()
            }
            
            // 구절
            HStack {
                Text(phrase.content ?? "")
                    .font(.bookk15)
                    .lineSpacing(15)
                    .foregroundStyle(.typo80)
                    .padding(.top, 7)
                    .padding(.bottom, 13)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            // 구절 밑 텍스트
            if let phraseBottom {
                Text(phraseBottom)
                    .font(.phraseBottom)
                    .foregroundStyle(.typo50)
            }
        }
        .padding(.horizontal, 35)
        .padding(.vertical, 30)
        .frame(maxHeight: .infinity)
        .background(.backDarker)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.typo25)
        }
        .overlay(alignment: .bottomTrailing) {
            Image(BreadImage.allCases[Int(phrase.book?.bread ?? 0)].imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .padding(.trailing, 15)
                .padding(.bottom, 10)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        return dateFormatter.string(from: date)
    }
}
