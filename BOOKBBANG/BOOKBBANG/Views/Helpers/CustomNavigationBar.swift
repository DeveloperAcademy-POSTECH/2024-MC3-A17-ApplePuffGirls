//
//  CustomNavigationBar.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/2/24.
//

import SwiftUI

enum NavigationType {
    case cancel, chevron
}

struct CustomNavigationBar: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isHighlighted: Bool
    var navigationType: NavigationType
    var title: String
    var rightTitle: String?
    
    var onCancel: (() -> Void)?
    var onChevron: (() -> Void)?
    var onRightButton: (() -> Void)?
    
    var body: some View {
        HStack {
            if navigationType == .cancel {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("취소")
                        .foregroundStyle(.greenMain100)
                        .font(.cancel)
                })
            }
            else {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.greenMain100)
                })
                
            }
            
            Spacer()
            
            Text(title)
                .foregroundStyle(.typo100)
                .font(.system(size: 18, weight: .semibold))
                .kerning(-0.4)
            
            Spacer()
            
            Button(action: {
                onRightButton?()
            }, label: {
                Text(rightTitle ?? "")
                    .foregroundStyle(isHighlighted ? .greenMain100 : .typo25)
                    .font(.system(size: 17, weight: .bold))
                    .kerning(-0.4)
            })
            
        }
        .padding(.horizontal, 23)
        .frame(height: 55)
        .background(.backLighter)
    }
    
}

#Preview {
    CustomNavigationBar(isHighlighted: .constant(true),
                        navigationType: .cancel,
                        title: "책 검색",
                        rightTitle: "다음")
}
