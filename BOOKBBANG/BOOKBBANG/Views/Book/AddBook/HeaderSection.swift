//
//  HeaderSection.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/2/24.
//

import SwiftUI

struct HeaderSection: View {
  var title: String
  var subtitle: String
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(title)
          .font(.addBookTitle)
          .foregroundStyle(.typo100)
          .padding(.bottom, 1)
        
        Text(subtitle)
          .font(.bookCaption)
          .foregroundStyle(.typo50)
      }
      Spacer()
    }
    .padding(.leading, 30)
  }
}

#Preview {
  HeaderSection(
    title: "제목입니달라",
    subtitle: "부제목입니달라"
  )
}
