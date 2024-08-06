//
//  DashLineDivider.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct DashLineDivider: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
    
    var body: some View {
        DashLineDivider()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
            .frame(width: 365, height: 1)
            .foregroundStyle(.typo50)
            .padding(.vertical, 15)
    }
}

#Preview {
    DashLineDivider()
}
