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
                        
                        VStack {
                            SegmentedBar(selected: $selected)
                            
                            switch selected {
                            case .book : VStack {
                                BookList()
                                    .padding(.horizontal, 22)
                                
                                // 임시 버튼 - 추후 삭제 예정
                                Button(action: {
                                    homeViewModel.transition(to: .searchBook)
                                }, label: {
                                    Image(systemName: "heart")
                                })
                            }
                            case .clip : ClipList()
                            }
                        }
                        .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal,2)
            }
            .background(.backLighter)
            
            switch homeViewModel.viewStatus {
            case .home:
                EmptyView()
            case .searchBook:
                SearchBook(homeViewModel: homeViewModel)
            case .detailBook:
                EmptyView()
            case .detailClip:
                EmptyView()
            case .addClip:
                EmptyView()
            case .receipt:
                EmptyView()
            case .setting:
                Setting(homeViewModel: homeViewModel,
                        settingViewModel: settingViewModel)
            }
        }
    }
}


struct HomeTopBar : View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 44, height: 44)
                .foregroundStyle(.typo25)
                .padding()
            
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

#Preview {
    Home(homeViewModel: HomeViewModel(), settingViewModel: SettingViewModel())
}
