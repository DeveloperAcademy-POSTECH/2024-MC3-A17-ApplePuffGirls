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
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    
    @FetchRequest(entity: Phrase.entity(), sortDescriptors: [])
    private var phrases: FetchedResults<Phrase>
    
    @State var todaysBread: Phrase?
    @State var selected: GroupBy = .book
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HomeTopBar()
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            TodaysBread()
                            VStack(spacing: 0) {
                                SegmentedBar(selected: $selected)
                                
                                switch selected {
                                case .book :
                                    BookList(homeViewModel: homeViewModel)
                                case .clip:
                                    ClipList()
                                }
                            }
                            .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
                            .padding(.horizontal,5)
                        }
                        .padding(.vertical, 5)
                    }
                    .scrollIndicators(.hidden)
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
                case .addBookFinal:
                    if let selectedBookData = homeViewModel.selectedBookData {
                        CompleteAddingBook(homeViewModel: homeViewModel, bookData: .constant(selectedBookData))
                    }
                case .detailBook:
                    if let selectedBook = homeViewModel.selectedBook {
                        DetailBook(homeViewModel: homeViewModel,
                                   detailBookViewModel: detailBookViewModel,
                                   book: selectedBook)
                        .environmentObject(homeViewModel)
                    }
                }
            }
        }
        .onAppear {
            todaysBread = phrases.randomElement()
        }
    }
    
    struct HomeTopBar : View {
        var body: some View {
            HStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 10)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: {
                        ReceiptMain()
                            .toolbarRole(.editor)
                    }, label: {
                        Text("빵수증")
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                    })
                    
                    NavigationLink(destination: {
                        Setting()
                            .toolbarRole(.editor)
                    }, label: {
                        Text("설정")
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                    })
                }
                .foregroundStyle(.typo100)
                
            }
            .padding(.horizontal, 15)
            .frame(height: 55)
        }
    }
}
