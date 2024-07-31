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
    
    var body: some View {
        Image(systemName: "plus")
            .foregroundStyle(.greenMain100)
            .font(.title3)
            .frame(width: CGFloat(width), height: CGFloat(height))
            .background(RoundedRectangle(cornerRadius: 13).stroke(style: StrokeStyle(lineWidth: 1, dash: [5])).foregroundStyle(.typo25))
    }
}

#Preview {
    EmptyBox(width: 55, height: 55)
}
