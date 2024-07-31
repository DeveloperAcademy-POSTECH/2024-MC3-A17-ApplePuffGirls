//
//  SearchBookListRow.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/1/24.
//

import SwiftUI

struct SearchBookListRow: View {
    var body: some View {
        HStack {
            fetchImage(url: "https://i.pinimg.com/564x/85/db/a0/85dba0c3a6bea2c19360aafe5e4cab29.jpg")
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer().frame(width: 12)
            
            VStack(alignment: .leading ,spacing: 0) {
                Text("한교동이 누군가를 죽였다")
                    .foregroundStyle(.typo100)
                    .font(.system(size: 20, weight: .bold))
                    .kerning(-1)
                
                Text("구리스(지은이), 이진토(엮은이)")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                
                Spacer()
                
                HStack {
                    Text("출판사")
                        .foregroundStyle(.typo30)
                        .font(.system(size: 13, weight: .regular))
                        .kerning(-0.4)
                    
                    Text("애플 디벨로퍼 아카데미")
                        .foregroundStyle(.typo80)
                        .font(.system(size: 13, weight: .regular))
                }
                
                HStack {
                    Text("발행일")
                        .foregroundStyle(.typo30)
                        .font(.system(size: 13, weight: .regular))
                        .kerning(-0.4)
                    
                    Text("2024.10.03")
                        .foregroundStyle(.typo80)
                        .font(.system(size: 13, weight: .regular))
                }
            }
            .padding(.vertical, 15)
            
            Spacer()
            
            Circle()
                .stroke(.typo25, lineWidth: 1.0)
                .frame(width: 23)
            
            Spacer().frame(width: 23)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 140)
    }
}

#Preview {
    SearchBookListRow()
}
