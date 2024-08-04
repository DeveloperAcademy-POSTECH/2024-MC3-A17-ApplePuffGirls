//
//  TwoLineDivider.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct TwoLineDivider: View {
    var body: some View {
        VStack(spacing: 2) {
            Rectangle()
                .frame(width: 365, height: 1)
            
            Rectangle()
                .frame(width: 365, height: 1)
        }
        .foregroundStyle(.typo25)
    }
}

#Preview {
    TwoLineDivider()
}
