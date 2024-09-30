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
                    .stroke(.typo10)
            }
    }
}

func fetchHomeImage(url: String) -> some View {
    AsyncImage(url: URL(string: url)) { image in
        image
            .resizable()
            .scaledToFill()
            .frame(width: 92, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.typo10)
            }
    } placeholder: {
        Image(.loadingThumbnail)
            .resizable()
            .scaledToFit()
            .frame(width: 105, height: 152)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.typo10)
            }
    }
}

func fetchReceiptImage(url: String) -> some View {
    AsyncImage(url: URL(string: url)) { image in
        image
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 105)
            .overlay {
                Rectangle()
                    .stroke(.typo10)
            }
    } placeholder: {
        Image(.loadingThumbnail)
            .resizable()
            .scaledToFit()
            .frame(width: 75, height: 105)
            .overlay {
                Rectangle()
                    .stroke(.typo10)
            }
    }
}
