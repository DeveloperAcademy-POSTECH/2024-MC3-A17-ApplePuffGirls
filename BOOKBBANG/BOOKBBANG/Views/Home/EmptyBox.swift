//
//  EmptyBox.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/31/24.
//

import SwiftUI


struct EmptyBox: View {
    var width: Int
    var height: Int
    var text: String?
    var isButton: Bool = true
    
    var body: some View {
        RoundedRectangle(cornerRadius: 13)
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundStyle(.typo25)
            .frame(width: CGFloat(width), height: CGFloat(height))
            .background(.backLighter)
            .overlay {
                if let text {
                    Text(text)
                        .foregroundStyle(isButton ? .greenMain100 : .typo50)
                        .font(.listTitle)
                } else {
                    Image(systemName: "plus")
                        .foregroundStyle(.greenMain100)
                        .font(.title3)
                }
            }
    }
}
