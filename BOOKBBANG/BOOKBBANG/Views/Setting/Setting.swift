//
//  Setting.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct Setting: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(isHighlighted: .constant(true),
                                    navigationType: .chevron,
                                    title: "설정",
                                    onChevron: { homeViewModel.transition(to: .home) })
                
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(SettingCategory.allCases, id: \.self) { page in
                        NavigationLink(destination: {
                            page.destination
                        }, label: {
                            SelectCategory(category: page)
                        })
                        
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .background(.backLighter)
        }
    }
}

struct SelectCategory: View {
    var category: SettingCategory
    
    var body: some View {
        VStack(spacing: 16) {
            category.image
                .resizable()
                .scaledToFit()
                .padding()
                .frame(height: 143)
            
            HStack(spacing: 0) {
                Text(category.title)
                    .font(.settingCategoryTitle)
                    .foregroundStyle(.typo100)
                    .kerning(-1)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.typo50)
            }
        }
        .padding(19)
        .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
    }
}

#Preview {
    Setting(homeViewModel: HomeViewModel())
}
