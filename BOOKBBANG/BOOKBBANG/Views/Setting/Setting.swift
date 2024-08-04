//
//  Setting.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

enum SettingCategory: CaseIterable {
    case manual
    case teamInfo
    case widget
    case alert
    
    var title: String {
        switch self {
        case .manual: return "책빵 사용설명서"
        case .teamInfo: return "Apple Puff Girls에 대해"
        case .widget: return "위젯 설정"
        case .alert: return "알림 설정"
        }
    }
    
    var image: Image {
        switch self {
        case .manual: return Image(.fish1)
        case .teamInfo: return Image(.teamLogo)
        case .widget: return Image(.fish2)
        case .alert: return Image(.fish4)
        }
    }
}

struct Setting: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var settingViewModel: SettingViewModel
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar(isHighlighted: .constant(true),
                                    navigationType: .chevron,
                                    title: "설정",
                                    onChevron: { homeViewModel.transition(to: .home) })
                
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(SettingCategory.allCases, id: \.self) { page in
                        SelectCategory(category: page, viewModel: settingViewModel)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .background(.backLighter)
            
            switch settingViewModel.viewStatus {
            case .setting:
                EmptyView()
            case .manual:
                Manual(settingViewModel: settingViewModel)
            case .teamInfo:
                TeamInfo(settingViewModel: settingViewModel)
            case .widget:
                Text("widget")
            case .alert:
                Text("alert")
            }
        }
    }
}

struct SelectCategory: View {
    var category: SettingCategory
    @ObservedObject var viewModel: SettingViewModel
    
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
        .onTapGesture {
            viewModel.selectCategory(category)
        }
    }
}

#Preview {
    NavigationStack {
        Setting(homeViewModel: HomeViewModel(),
                settingViewModel: SettingViewModel())
    }
}
