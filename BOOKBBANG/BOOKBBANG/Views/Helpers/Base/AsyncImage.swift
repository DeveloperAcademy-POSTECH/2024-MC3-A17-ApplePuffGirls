//
//  AsyncImage.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/1/24.
//

import SwiftUI

func fetchImage(url: String) -> some View {
    AsyncImage(url: URL(string: url)) { image in
        image
            .resizable()
            .scaledToFill()
            .frame(width: 86, height: 140)
    } placeholder: {
        Image(.loadingThumbnail)
            .resizable()
            .scaledToFit()
            .frame(width: 86, height: 140)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.typo25)
            }
    }
}

func fetchHomeImage(url: String) -> some View {
    AsyncImage(url: URL(string: url)) { image in
        image
            .resizable()
            .scaledToFill()
            .frame(width: 105, height: 155)
            .clipShape(RoundedRectangle(cornerRadius: 13))
    } placeholder: {
        Image(.loadingThumbnail)
            .resizable()
            .scaledToFit()
            .frame(width: 105, height: 152)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.typo25)
            }
    }
}
