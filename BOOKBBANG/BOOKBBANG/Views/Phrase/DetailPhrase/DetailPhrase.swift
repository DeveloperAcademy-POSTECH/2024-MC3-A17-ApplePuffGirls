//
//  DetailPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/4/24.
//

import SwiftUI

struct DetailPhrase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CustomNavigationBar(isHighlighted:.constant(true) ,
                                navigationType: .chevron,
                                title: "빵 상세보기",
                                rightTitle: "수정")
            Text("내가 구운 빵")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 8)
                .padding(.leading, 30)
            
            PhraseCard(display: .detailPhrase)
            
            Spacer().frame(height: 21)
            
            DetailPhraseClipList()
            
            Spacer().frame(height: 21)
            
            Text("빵 속에 담긴 나의 생각")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 8)
                .padding(.leading, 30)
            
            Color.backDarker
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(.typo25)
                }
                .frame(width: .infinity, height: 48)
                .overlay {
                    HStack {
                        Text("보노 고마워 짱 천재여자야")
                            .foregroundStyle(.typo100)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                    }.padding(.leading, 20)
                }
            Spacer().frame(height: .infinity)
        } .padding(.horizontal, 2)
            .background(.backLighter)
        }
        
    }

#Preview {
    DetailPhrase()
}
