//
//  Setting.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

enum SettingCategory {
    case manual
    case teamInfo
}

struct SettingDetail: Hashable {
    var title: String
    var image: String
    var category: SettingCategory
}

struct Setting: View {
    var settingPage: [SettingDetail] = [
        SettingDetail(title: "책빵 사용설명서", image: "fish_1", category: .manual),
        SettingDetail(title: "Apple Puff Girls에 대해", image: "TeamLogo", category: .teamInfo)]
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2)
        ]
    
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false), navigationType: .chevron, title: "설정")
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(settingPage, id: \.self) { page in
                    SelectCategory(page: page)
                }
            }
            
            Spacer()
        }
        .padding(2)
        .background(.backLighter)
    }
}

struct SelectCategory: View {
    var page: SettingDetail
    
    var body: some View {
        NavigationLink {
            switch page.category {
            case .manual:
                Manual()
            case .teamInfo:
                TeamInfo()
            }
        } label: {
            VStack(spacing: 16) {
                Image(page.image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(height: 143)
                
                HStack(spacing: 0) {
                    Text(page.title)
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
}

#Preview {
    NavigationStack {
        Setting()
    }
}
