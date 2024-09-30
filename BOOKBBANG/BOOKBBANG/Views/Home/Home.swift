//
//  Home.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//

import SwiftUI
import CoreData

struct Home: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var settingViewModel: SettingViewModel
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    
    @FetchRequest(entity: Phrase.entity(), sortDescriptors: [])
    private var phrases: FetchedResults<Phrase>
    
    @State var todaysBread: Phrase?
    @State var selected: GroupBy = .book
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HomeTopBar(homeViewModel: homeViewModel)
                    
                    ScrollView {
                        VStack(spacing: 2) {
                            TodaysBread()
                            VStack(spacing: 2) {
                                
                                SegmentedBar(selected: $selected)
                                
                                switch selected {
                                case .book :
                                    BookList(homeViewModel: homeViewModel)
                                case .clip:
                                    ClipList(detailBookViewModel: detailBookViewModel)
                                        .environmentObject(homeViewModel)
                                }
                            }
                            .scrollIndicators(.hidden)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
                            .padding(.horizontal,2)
                        }
                    }
                }
                .background(.backLighter)
                
                switch homeViewModel.viewStatus {
                case .home:
                    EmptyView()
                case .searchBook:
                    SearchBook(homeViewModel: homeViewModel)
                case .addBook:
                    if let selectedBookData = homeViewModel.selectedBookData {
                        AddBook(homeViewModel: homeViewModel,
                                bookData: .constant(selectedBookData))
                    }
                case .addDough:
                    if let selectedBookData = homeViewModel.selectedBookData {
                        AddDough(homeViewModel: homeViewModel,
                                 bookData: .constant(selectedBookData))
                    }
                case .addBookFinal:
                    CompleteAddingBook(homeViewModel: homeViewModel)
                case .detailBook:
                    if let selectedBook = homeViewModel.selectedBook {
                        DetailBook(homeViewModel: homeViewModel,
                                   detailBookViewModel: detailBookViewModel,
                                   book: selectedBook)
                        .environmentObject(homeViewModel)
                    }
                case .receipt:
                    ReceiptMain(homeViewModel: homeViewModel)
                case .setting:
                    Setting(homeViewModel: homeViewModel)
                case .detailClip:
                    if let selectedClip = homeViewModel.selectedClip {
                        DetailClip(detailBookViewModel: detailBookViewModel, clip: selectedClip)
                            .environmentObject(homeViewModel)
                    }
                }
            }
            .onAppear {
                todaysBread = phrases.randomElement()
            }
        }
    }
    
    
    struct HomeTopBar : View {
        @ObservedObject var homeViewModel: HomeViewModel
        
        var body: some View {
            HStack {
                Image(.mainLogo)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .padding(.leading, 10)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        homeViewModel.transition(to: .receipt)
                    }, label: {
                        Text("빵수증")
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                    })
                    
                    Button(action: {
                        homeViewModel.transition(to: .setting)
                    }, label: {
                        Text("설정")
                            .font(.system(size: 16, weight: .semibold))
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
