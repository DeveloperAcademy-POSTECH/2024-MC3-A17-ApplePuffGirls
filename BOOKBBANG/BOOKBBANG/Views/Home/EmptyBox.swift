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
        if let text {
            Text(text)
                .foregroundStyle(isButton ? .greenMain100 : .typo50)
                .font(.listTitle)
                .frame(width: CGFloat(width), height: CGFloat(height))
                .background(RoundedRectangle(cornerRadius: 13).stroke(style: StrokeStyle(lineWidth: 1, dash: [5])).foregroundStyle(.typo25))
        } else {
            Image(systemName: "plus")
                .foregroundStyle(.greenMain100)
                .font(.title3)
                .frame(width: CGFloat(width), height: CGFloat(height))
                .background(RoundedRectangle(cornerRadius: 13).stroke(style: StrokeStyle(lineWidth: 1, dash: [5])).foregroundStyle(.typo25))
        }
    }
}

#Preview {
    EmptyBox(width: 294, height: 305, text: "+  지금 빵수증 발급하기")
}
