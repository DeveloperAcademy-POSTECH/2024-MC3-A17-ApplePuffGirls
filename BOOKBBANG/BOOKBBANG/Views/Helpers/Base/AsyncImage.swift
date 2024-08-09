//
//  AsyncImage.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/1/24.
//

import SwiftUI

func fetchImage(url: String) -> some View {
    AsyncImage(url: URL(string: url)) { image in
        image.resizable()
    } placeholder: {
        ProgressView()
    }
    .scaledToFill()
    .frame(width: 86, height: 140)
    .overlay(
        RoundedRectangle(cornerRadius: 13)
            .inset(by: 0.5)
            .stroke(.typo10)
    )
}

func fetchHomeImage(url: String) -> some View {
    AsyncImage(url: URL(string: url)) { image in
        image.resizable()
    } placeholder: {
        ProgressView()
    }
    .scaledToFill()
    .frame(width: 105, height: 152)
    .clipShape(RoundedRectangle(cornerRadius: 13))
    .overlay(
        RoundedRectangle(cornerRadius: 13)
            .inset(by: 0.5)
            .stroke(.typo10)
    )
    
    
}
