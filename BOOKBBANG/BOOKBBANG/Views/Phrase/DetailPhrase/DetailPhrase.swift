//
//  DetailPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/4/24.
//

import SwiftUI

struct DetailPhrase: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    @State private var isEditPhrasePresented: Bool = false
    
    @ObservedObject var phrase: Phrase
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted:.constant(true) ,
                                navigationType: .chevron,
                                title: "빵 상세보기",
                                rightTitle: "수정",
                                onChevron: { dismiss() },
                                onRightButton: { isEditPhrasePresented.toggle()})
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("내가 구운 빵")
                        .foregroundStyle(.typo50)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.bottom, 8)
                        .padding(.leading, 30)
                    
                    PhraseCard(display: .detailPhrase,
                               phrase: phrase)
                    .padding(.bottom, 20)
                    
                    Text("\(phrase.clips?.count ?? 324)")
                    ForEach(phrase.clips?.allObjects as! [Clip], id: \.self) { clip in
                        Text(clip.title ?? "no name")
                    }
                    
//                    DetailPhraseClipList()
//                        .padding(.bottom, 20)
                    
                    Text("빵 속에 담긴 나의 생각")
                        .foregroundStyle(.typo50)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.bottom, 8)
                        .padding(.leading, 30)
                    
                    Text(phrase.thinking ?? "")
                        .foregroundStyle(.typo100)
                        .font(.system(size: 15, weight: .regular))
                        .lineSpacing(10)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 30)
                        .multilineTextAlignment(.leading)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.backDarker))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.typo25)
                        }
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 2)
        .background(.backLighter)
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isEditPhrasePresented, content: {
            EditPhrase(phrase: phrase, showEditSheet: $isEditPhrasePresented)
        })
    }
}

//#Preview {
//    DetailPhrase(detailBookViewModel: DetailBookViewModel())
//}
