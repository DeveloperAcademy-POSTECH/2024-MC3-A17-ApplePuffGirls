//
//  AddClip.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddClip: View {
    @ObservedObject var clipData = ClipData(selectedShape: 0, 
                                            selectedColor: 0)
    
    private let nameLimit = 13
    private let descriptionLimit = 25
    var navigationTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .cancel,
                                title: navigationTitle,
                                rightTitle: "저장")
            
            TopClipImage(clipData: clipData)
            
            VStack(alignment: .leading) {
                ClipTextFields(clipData: clipData)
                
                ClipShapeButton(clipData: clipData)
                    .padding(.vertical, 5)
                
                ClipColorButton(clipData: clipData)
                
                Spacer()
            }
        }
        .background(.backLighter)
    }
}



#Preview {
    AddClip(navigationTitle: "새로운 클립 추가")
}
