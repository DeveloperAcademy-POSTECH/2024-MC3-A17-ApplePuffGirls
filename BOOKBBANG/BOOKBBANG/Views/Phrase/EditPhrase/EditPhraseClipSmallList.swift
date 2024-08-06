//
//  EditPhraseTest.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/6/24.
//

import SwiftUI

public struct EditPhraseClipSmallList: View {
    @State private var totalHeight: CGFloat = .zero
    let verticalSpacing: CGFloat
    let horizontalSpacing: CGFloat
    let items: [ChipsType]
    var sortedItems: [ChipsType] {
        items.sorted(by: { $0.clippriority < $1.clippriority })
    }
    
    public init(
        verticalSpacing: CGFloat = 10,
        horizontalSpacing: CGFloat = 20,
        items: [ChipsType]
    ) {
        self.verticalSpacing = verticalSpacing
        self.horizontalSpacing = horizontalSpacing
        self.items = items
    }
    
    public var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(self.sortedItems) { item in
                    ChipsView(cliptitle: item.cliptitle, clipimage: item.clipimage)
                        .id(item.id)
                        .alignmentGuide(.leading) { view in
                            if abs(width - view.width) > geometry.size.width {
                                width = 0
                                height -= view.height
                                height -= verticalSpacing
                            }
                            let result = width
                            
                            if item == sortedItems.last {
                                width = 0
                            } else {
                                width -= view.width
                                width -= horizontalSpacing
                            }
                            
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = height
                            
                            if item == sortedItems.last {
                                height = 0
                            }
                            return result
                        }
                }
            }
            .background(
                GeometryReader { innerGeometry in
                    Color.clear
                        .onAppear {
                            self.totalHeight = innerGeometry.size.height
                        }
                }
            )
        }
        .frame(height: totalHeight)
    }
}


#Preview {
    EditPhraseClipSmallList(
        items: [
            ChipsType(cliptitle: "저에게 이런 코드를 주셔서감사합니달라", clippriority: 1, clipimage: "fish_1"),
            ChipsType(cliptitle: "클립 제목2", clippriority: 2, clipimage: "fish_2"),
            ChipsType(cliptitle: "클립 제목3", clippriority: 3, clipimage: "fish_3"),
            ChipsType(cliptitle: "클립 제목4", clippriority: 4, clipimage: "fish_4")
        ]
    )
}
