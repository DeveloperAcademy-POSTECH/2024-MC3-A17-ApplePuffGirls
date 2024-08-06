//
//  CompleteAddingBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/1/24.
//

import SwiftUI

struct CompleteAddingBook: View {
    var body: some View {
        
        VStack{
            HeaderSection(title: "책 추가를 완료했습니다",
                          subtitle: "맛있는 빵을 만들러 가볼까요?")
            .padding(.top, 150)
            .padding(.bottom, 50)
            
            Image(.baking2)
        }
    }
}

#Preview {
    CompleteAddingBook()
}
