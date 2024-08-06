//
//  Home.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//

import SwiftUI

struct Home: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var settingViewModel: SettingViewModel
    
    @State var selected: GroupBy = .book
    
    var body: some View {
        ZStack {
            VStack {
                HomeTopBar(homeViewModel: homeViewModel)
                ScrollView {
                    VStack(spacing: 2) {
                        PhraseCard(display: .todaysBread)
                        
                        SegmentedBar(selected: $selected)
                        
                        switch selected {
                        case .book :
                            BookList(homeViewModel: homeViewModel)
                                .padding(.horizontal, 22)
                                .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
                        case .clip:
                            ClipList()
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal,2)
                }
                .background(.backLighter)
            }
            switch homeViewModel.viewStatus {
            case .home:
                EmptyView()
            case .searchBook:
                SearchBook(homeViewModel: homeViewModel)
            case .detailBook:
                EmptyView()
            case .receipt:
                ReciptMain(homeViewModel: homeViewModel)
            case .setting:
                Setting(homeViewModel: homeViewModel)
            }
        }
    }
    
    
    struct HomeTopBar : View {
        @ObservedObject var homeViewModel: HomeViewModel
        
        var body: some View {
            HStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .padding(.leading, 10)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        homeViewModel.transition(to: .receipt)
                    }, label: {
                        Text("빵수증")
                            .padding()
                    })
                    
                    Button(action: {
                        homeViewModel.transition(to: .setting)
                    }, label: {
                        Text("설정")
                            .padding()
                    })
                }
                .foregroundStyle(.typo100)
                
            }
            .padding(.horizontal, 10)
            .frame(height: 55)
        }
    }
}

#Preview {
    Home(homeViewModel: HomeViewModel(), settingViewModel: SettingViewModel())
}
