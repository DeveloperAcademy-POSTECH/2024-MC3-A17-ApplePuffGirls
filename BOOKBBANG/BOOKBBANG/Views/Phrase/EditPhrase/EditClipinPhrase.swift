//
//  EditClipinPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/5/24.
//

import SwiftUI

struct EditClipinPhrase: View {
    @State private var items: [String] = ["클립 제목1", "클립 제목 또 추가", "카테고리 클립 추추추추가요"]
    @State private var selections: [String] = []
    @State private var clipImage: [String] = ["fish_1", "fish_2", "fish_3"]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "빵클립")
            MultipleSelectionList(items: $items, clipImage: $clipImage, selections: $selections)
            
            NewClipButton()
            Spacer()
        }.background(Color.backLighter)
    }
}

#Preview {
    EditClipinPhrase()
}
