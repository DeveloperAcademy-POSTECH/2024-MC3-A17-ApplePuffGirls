//
//  AddBookTitle.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/31/24.
//

import SwiftUI

struct AddBookTitle: View {
    @Binding var progress: Double
    @Binding var showingAddDough: Bool

    var body: some View {
        VStack {
            ProgressView(value: progress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .greenMain100))
                .padding(.top, 5)

            Spacer()
        }
    }
}

