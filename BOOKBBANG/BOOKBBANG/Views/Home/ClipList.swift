//
//  ClipList.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//
// 메인화면에 보이는 클립별 리스트 화면입니다.

import SwiftUI

struct ClipList: View {
    @State var sort: SortClipBy = .updated
    
    var body: some View {
        VStack {
            // 정렬 버튼
            HStack {
                Spacer()
                SortingClipPicker(sort: $sort)
            }
            .frame(height: 60)
            
            VStack {
                // 새로운 클립 만들기
                NewClipButton()
                
                
                // 클립 리스트
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Divider()
                    ClipView()
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

// 리스트 중 하나의 클립(NavigationLink)을 보여줍니다.
struct ClipView: View {
    var body: some View {
        NavigationLink {
            Text("hi,,")
        } label: {
            HStack {
                Rectangle()
                    .frame(width: 55, height: 55)
                    .foregroundStyle(.typo50)
                
                VStack(alignment: .leading) {
                    Text("행복한 나의 빵 먹기 생활")
                        .font(.listTitle)
                        .foregroundStyle(.typo100)
                        .padding(.bottom, 2)
                    
                    Text("구절 8개")
                        .font(.phraseBottom)
                        .foregroundStyle(.typo50)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.typo50)
            }
            .padding(.horizontal, 13)
            .frame(height: 70)
        }
        
        
    }
}

// 새로운 클립 만들기 네비게이션 버튼
struct NewClipButton: View {
    @State var showingSheet: Bool = false
    var body: some View {
        Button {
            showingSheet = true
        } label: {
            VStack {
                Divider()
                HStack {
                    // 박스 그림
                    EmptyBox(width: 55, height: 55)
                    
                    Text("새로운 클립 만들기")
                        .font(.listTitle)
                        .foregroundStyle(.greenMain100)
                        .padding(.leading, 15)
                    
                    Spacer()
                }
                .frame(height: 70)
                .padding(.horizontal, 13)
            }
        }
        .sheet(isPresented: $showingSheet){
            // 클립 만들기 뷰
        }
    }
}

#Preview {
    NavigationView {
        ClipList()
            .padding(.horizontal,2)
            .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
    }
}
