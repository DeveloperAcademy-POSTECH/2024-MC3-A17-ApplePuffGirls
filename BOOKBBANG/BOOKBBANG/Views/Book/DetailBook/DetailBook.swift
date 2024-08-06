//
//  DetailBook.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct DetailBook: View {
    @Environment(\.dismiss) var dismiss
    @State private var isEditBookPresented: Bool = false
    
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "책 상세정보",
                                rightTitle: "수정",
                                onChevron: { dismiss() },
                                onRightButton: { isEditBookPresented.toggle() })
            
            ScrollView {
                VStack(spacing: 2) {
                    BookInfo()
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        
                        HStack(spacing: 0) {
                            Text("총 ")
                                .font(.bookCaption)
                            Text("\(2)")
                                .font(.bookCaptionBold)
                            Text("개")
                                .font(.bookCaption)
                        }
                        Spacer()
                        
                        Text("+  구절 추가하기")
                            .font(.bookCaption)
                            .frame(width: 118, height: 40)
                            .foregroundStyle(.white)
                            .background(Capsule().foregroundStyle(.greenMain100))
                        
                    }
                    .foregroundStyle(.typo50)
                    .padding(.horizontal, 26)
                    .padding(.bottom, 27)
                    
                    PhraseCard()
                    PhraseCard()
                    PhraseCard()
                    
                }
                .padding(.horizontal, 2)
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden()
        .background(.backLighter)
        .sheet(isPresented: $isEditBookPresented) {
            EditBook(isPresented: $isEditBookPresented)
        }
    }
}



#Preview {
    NavigationStack {
        DetailBook()
    }
}
