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
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>
    
    var body: some View {
        
        VStack {
//            ForEach(clips) { clip in
//                if let title = clip.title {
//                    Text(title)
//                }
//            }
            
            // 정렬 버튼
            HStack {
                Spacer()
                SortingClipPicker(sort: $sort)
            }
            
            VStack {
                // 새로운 클립 만들기
                NewClipButton()
                
                // 클립 리스트
                ForEach(clips) { clip in
                    Divider()
                    
                    NavigationLink(destination: {
                        DetailClip(clip: clip)
                    }, label: {
                        ClipView(clip: clip)
                    })
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
    @ObservedObject var clip: Clip
    
    var body: some View {
        HStack {
            // 클립 이미지
            Image(ClipItem.allCases[Int(clip.design)].clipImageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Colors.allCases[Int(clip.color)].color)
                .padding(8)
            
            VStack(alignment: .leading) {
                Text(clip.title ?? "")
                    .font(.listTitle)
                    .foregroundStyle(.typo100)
                    .padding(.bottom, 2)
                
                Text("구절 8개")
                    .font(.phraseBottom)
                    .foregroundStyle(.typo50)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.typo50)
        }
        .padding(.horizontal, 13)
        .frame(height: 70)
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
            AddClip(navigationTitle: "새로운 클립 추가")
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
