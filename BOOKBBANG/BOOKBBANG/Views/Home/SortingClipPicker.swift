//
//  SortingClipPicker.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/31/24.
//

import SwiftUI


enum SortClipBy: String, CaseIterable {
    case updated = "최근 추가 순"
    case created = "최근 생성 순"
}

struct SortingClipPicker: View {
    @Binding var sort: SortClipBy
    
    var body: some View {
        HStack {
            Spacer()
            
            Menu {
                Picker("sort by", selection: $sort) {
                    ForEach(SortClipBy.allCases, id: \.self) { selection in
                        Text(selection.rawValue).tag(selection)
                    }
                    
                }
            } label: {
                Label("Filter", systemImage: "line.3.horizontal.decrease")
                    .font(.title3)
                    .labelStyle(.iconOnly)
            }
            .padding()
        }
        .frame(height: 60)
    }
}
