//
//  AddDough.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/31/24.
//

import SwiftUI

struct AddDough: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State var selectedDough: DoughImage? = .croissant
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "새로운 책 추가하기",
                                rightTitle: "다음",
                                onChevron: { homeViewModel.transition(to: .addBook) },
                                onRightButton: { homeViewModel.transition(to: .addBookFinal) })
            
            SearchBookProgressBar(process: 3)
                .padding(.bottom, 30)
            
            HeaderSection(title: "빵 반죽을 선택해주세요",
                          subtitle: "선택한 반죽에 따라 고유한 문구들이 담긴 빵이 구워져요")
            .padding(.top, 20)
            
            
            Image(selectedDough?.imageName ?? DoughImage.croissant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
                .padding(.vertical, 40)
            
            
            Text("빵 반죽")
                .font(.bookCaption)
                .foregroundStyle(.typo50)
                .padding(.trailing, 300)
                .padding(.vertical, 15)
            
            VStack(spacing: 12) {
                ForEach(0..<(DoughImage.allDoughCount / 4) + 1, id: \.self) { rowIndex in
                    HStack(spacing: 12) {
                        ForEach(0..<4) { columnIndex in
                            let index = rowIndex * 4 + columnIndex
                            if index < DoughImage.allCases.count {
                                let dough = DoughImage.allCases[index]
                                Button(action: {
                                    selectedDough = dough
                                }) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(selectedDough == dough ? Color.green : Color.gray, lineWidth: selectedDough == dough ? 2 : 1)
                                        .background(
                                            Image(dough.imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .padding(7)
                                        )
                                        .frame(width: 80, height: 80)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding(.leading, 20)
            
            Spacer()
        }
        .background(.backLighter)
    }
}


#Preview {
    AddDough(homeViewModel: HomeViewModel())
}

