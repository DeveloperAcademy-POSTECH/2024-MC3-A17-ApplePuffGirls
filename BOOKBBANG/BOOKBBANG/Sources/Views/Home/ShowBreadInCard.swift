//
//  ShowBreadInCard.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/11/24.
//

import SwiftUI

struct ShowBreadInCard: View {
    @Binding var breadImage: String
    
    var body: some View {
        Image(breadImage)
            .resizable()
            .scaledToFit()
            .frame(width: 50)
    }
}
