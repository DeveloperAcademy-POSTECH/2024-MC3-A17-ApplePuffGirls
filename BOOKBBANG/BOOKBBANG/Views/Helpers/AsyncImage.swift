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
}
