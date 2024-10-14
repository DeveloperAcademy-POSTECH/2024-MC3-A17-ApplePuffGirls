//
//  DetailPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/4/24.
//

import SwiftUI

struct DetailPhrase: View {
    @Environment(\.dismiss) var dismiss
    @State private var isEditPhrasePresented: Bool = false
    @ObservedObject var phrase: Phrase
    
    var body: some View {
        VStack(spacing: 0) {
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
                    
                    Text("빵 클립")
                        .foregroundStyle(.typo50)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.bottom, 8)
                        .padding(.leading, 30)
                    
                    let clipsArray = phrase.clips?.allObjects as? [Clip] ?? []
                    ClipsInPhrase(clips: clipsArray)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.backDarker)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.typo25)
                        }
                        .padding(.bottom, 20)
                    
                    Text("빵 속에 담긴 나의 생각")
                        .foregroundStyle(.typo50)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.bottom, 8)
                        .padding(.leading, 30)
                    
                    HStack {
                        Text(phrase.thinking ?? "")
                            .foregroundStyle(.typo100)
                            .font(.system(size: 15, weight: .regular))
                            .lineSpacing(10)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 30)
                    .multilineTextAlignment(.leading)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.backDarker))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.typo25)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 5)
        .background(.backLighter)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isEditPhrasePresented.toggle()
                }) {
                    Text("수정")
                        .font(.system(size: 17, weight: .bold))
                        .kerning(-0.4)
                        .foregroundStyle(.greenMain100)
                }
            }
            ToolbarItem(placement: .principal) {
             Text("빵 상세보기")
                    .font(.navigation)
                    .kerning(-0.4)
                    .foregroundStyle(.typo100)
            }
        }
        .sheet(isPresented: $isEditPhrasePresented, content: {
            EditPhrase(phrase: phrase, showEditSheet: $isEditPhrasePresented)
        })
    }
}
