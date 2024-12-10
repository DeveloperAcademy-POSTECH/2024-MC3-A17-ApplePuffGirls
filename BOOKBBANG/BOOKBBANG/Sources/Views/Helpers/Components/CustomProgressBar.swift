//
//  CustomProgressBar.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 10/10/24.
//

import SwiftUI

struct CustomProgressBar: View {
    @Binding var process: Int
    let count: Int
    let animationDuration: Double = 0.5
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(0..<count, id: \.self) { index in
                    Rectangle()
                        .foregroundColor(index < process ? Color.greenMain100 : Color.typo25)
                        .frame(width: geometry.size.width / CGFloat(count), height: 2)
                        .animation(.easeInOut(duration: animationDuration), value: process)
                }
            }
        }
        .frame(height: 2)
    }
}
