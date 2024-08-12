//
//  ClipList.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//
// 메인화면에 보이는 클립별 리스트 화면입니다.

import SwiftUI
import CoreData

struct ClipList: View {
    @State var sort: SortClipBy = .updated
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>
    
    @FetchRequest(entity: Book.entity(), sortDescriptors: [])
    private var books: FetchedResults<Book>
    
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    
    var sortedClips: [Clip] {
        switch sort {
        case .updated:
            return clips.sorted { getPhraseRecentDate(phrases: $0.phrases) > getPhraseRecentDate(phrases: $1.phrases) }
        case .created:
            return clips.sorted { $0.createdDate ?? Date() > $1.createdDate ?? Date() }
        }
    }
    
    func getPhraseRecentDate(phrases: NSSet?) -> Date {
        guard let phraseArray = phrases?.allObjects as? [Phrase] else {
            return Date()
        }
        
        if let recentDate = phraseArray.compactMap({ $0.createdDate }).max() {
            return recentDate
        }
        return Date()
    }
    
    var body: some View {
        VStack {
            // 정렬 버튼
            HStack {
                Spacer()
                SortingClipPicker(sort: $sort)
            }
            
            VStack {
                // 새로운 클립 만들기
                VStack {
                    Divider()
                    NewClipButton()
                }
                
                // 클립 리스트
                ForEach(sortedClips) { clip in
                    Divider()
                    
                    NavigationLink(destination: {
                        DetailClip(detailBookViewModel: detailBookViewModel, clip: clip)
                    }, label: {
                        ClipView(clip: clip, viewContext: viewContext)
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
    var viewContext: NSManagedObjectContext
    
    var phraseCount: Int {
        countPhrasesContainingClip(clip: clip, context: viewContext)
    }
    
    var body: some View {
        HStack(spacing: 25) {
            // 클립 이미지
            Image(ClipItem.allCases[Int(clip.design)].clipImageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundStyle(Colors.allCases[Int(clip.color)].color)
                
            
            VStack(alignment: .leading) {
                Text(clip.title ?? "")
                    .font(.listTitle)
                    .foregroundStyle(.typo100)
                    .padding(.bottom, 2)
                
                
                Text("구절 \(phraseCount)개")
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
                //Divider()
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
            AddClip()
        }
    }
}
