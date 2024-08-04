//
//  SortingBookPicker.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/31/24.
//

import SwiftUI


enum SortBookBy: String, CaseIterable {
    case recentRegister = "최근 등록 순"
    case recentRead = "최근 읽은 순"
    case registerPhrase = "구절 등록 순"
}

struct SortingBookPicker: View {
    @Binding var sort: SortBookBy
    
    var body: some View {
        HStack {
            Spacer()
            
            Menu {
                Picker("sort by", selection: $sort) {
                    ForEach(SortBookBy.allCases, id: \.self) { selection in
                        Text(selection.rawValue).tag(selection)
                    }
                    
                }
            } label: {
                Label("Filter", systemImage: "line.3.horizontal.decrease")
                    .font(.title3)
                    .labelStyle(.iconOnly)
                    .padding(.horizontal, 22)
            }
        }
        .frame(height: 60)
    }
}
