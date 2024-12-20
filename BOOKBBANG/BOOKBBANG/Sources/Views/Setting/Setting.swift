//
//  Setting.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct Setting: View {
    let columns = [
        GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(SettingCategory.allCases, id: \.self) { page in
                        if page == .contact {
                            Button(action: {
                                page.handleContactTap()
                            }, label: {
                                SelectCategory(category: page)
                            })
                        }
                        else {
                            NavigationLink(destination: {
                                page.destination?.toolbarRole(.editor)
                            }, label: {
                                SelectCategory(category: page)
                            })
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 32)
                
                Spacer()
            }
            .padding(.top, 30)
            .background(.backLighter)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
             Text("설정")
                    .font(.navigation)
                    .kerning(-0.4)
                    .foregroundStyle(.typo100)
            }
        }
    }
}

struct SelectCategory: View {
    var category: SettingCategory
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            category.image
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding(.bottom, 20)
            
            HStack(spacing: 0) {
                Text(category.title)
                    .font(.settingCategoryTitle)
                    .foregroundStyle(.typo100)
                    .kerning(-0.4)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.typo50)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        }
        .frame(height: 187)
        .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
    }
}
