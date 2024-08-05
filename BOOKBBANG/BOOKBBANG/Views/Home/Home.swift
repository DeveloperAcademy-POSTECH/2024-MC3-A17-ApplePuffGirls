//
//  Home.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//

import SwiftUI

struct Home: View {
    @State var selected: GroupBy = .book
    
    var body: some View {
        NavigationStack {
            VStack {
                // 상단 바
                TopBar()
                
                ScrollView {
                    VStack(spacing: 2) {
                        // 오늘의 문장(빵)
                        PhraseCard(display: .todaysBread)
                        
                        // 리스트
                        VStack {
                            SegmentedBar(selected: $selected)
                            
                            switch selected {
                            case .book : VStack {
                                BookList()
                                    
                                NavigationLink(destination: SearchBook(), label: {
                                    fetchImage(url: "https://i.pinimg.com/736x/41/8f/32/418f32974d9e8bfe7ad018ce9ae31476.jpg")
                                })
                                    .padding(.horizontal, 22)
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
        }
    }
}

struct TopBar : View {
    var body: some View {
        HStack {
            // App icon
            Rectangle()
                .frame(width: 44, height: 44)
                .foregroundStyle(.typo25)
                .padding()
            Spacer()
            
            HStack {
                NavigationLink {
                    ReciptMain()
                } label: {
                    Text("빵수증")
                        .padding()
                }
                
                NavigationLink {
                    Setting()
                } label: {
                    Text("설정")
                        .padding()
                }
            }
            .foregroundStyle(.typo100)
            
        }
        .padding(.horizontal, 10)
        .frame(height: 75)
    }
}

#Preview {
    NavigationStack {
        Home()
    }
}
