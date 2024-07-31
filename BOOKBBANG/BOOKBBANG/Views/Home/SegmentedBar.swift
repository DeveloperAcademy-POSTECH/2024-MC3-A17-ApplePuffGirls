//
//  SegmentedBar.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/31/24.
//
// 메인화면에서 책과 클립으로 그룹핑해 볼 수 있는 세그먼트입니다.

import SwiftUI

enum GroupBy: String, CaseIterable {
    case book = "책별"
    case clip = "클립별"
}

struct SegmentedBar: View {
    let segments: [GroupBy] = GroupBy.allCases
    @Binding var selected: GroupBy
    @Namespace var name
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments, id: \.self) { segment in
                Button {
                    selected = segment
                } label : {
                    VStack(spacing: 0) {
                        Text(segment.rawValue)
                            .font(selected == segment ? .segmentSelected : .segment)
                            .foregroundStyle(selected == segment ? .typo100 : .typo50)
                            .frame(height: 50)
                        ZStack {
                            Capsule()
                                .fill(.typo25)
                                .frame(height: 1)
                                .padding(.vertical, 0.5)
                            if selected == segment {
                                Capsule()
                                    .fill(.greenMain100)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    SegmentedBar(selected: .constant(.book))
}
