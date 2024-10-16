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
    
    @State private var showDeleteClipAlert: Bool = false
    @State private var selectedDeleteClip: Clip?
    
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
            HStack {
                Spacer()
                SortingClipPicker(sort: $sort)
            }
            
            VStack {
                ForEach(sortedClips) { clip in
                    NavigationLink(destination: {
                        DetailClip(clip: clip)
                    }, label: {
                        ClipView(clip: clip, viewContext: viewContext)
                    })
                    .contextMenu {
                        Button(role: .destructive) {
                            selectedDeleteClip = clip
                            showDeleteClipAlert = true
                        }
                        label: {
                            Label("삭제하기", systemImage: "trash")
                        }
                    }
                    .alert(Text("삭제하면 해당 클립은 되돌릴 수 없습니다."), isPresented: $showDeleteClipAlert, actions: {
                        if let clip = selectedDeleteClip {
                            alertView(clip: clip)
                        }
                    }, message: { Text("클립을 삭제하시겠습니까?")})
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                if sortedClips.isEmpty {
                    Divider()
                }
                NewClipButton()
            }
        }
    }
    
    @ViewBuilder
    private func alertView(clip: Clip) -> some View {
        Button("취소", role: .cancel) { }
        Button("삭제하기", role: .destructive) { deleteClip(clip: clip) }
    }
    
    private func deleteClip(clip: Clip) {
        viewContext.delete(clip)
        
        do {
            try viewContext.save()
        } catch {
            print("Failed to delete clip: \(error.localizedDescription)")
        }
    }
}

struct ClipView: View {
    @ObservedObject var clip: Clip
    var viewContext: NSManagedObjectContext
    
    var phraseCount: Int {
        countPhrasesContainingClip(clip: clip, context: viewContext)
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 25) {
                Image(ClipItem.getClipShape(clip.design))
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55, height: 55)
                    .foregroundStyle(Colors.getClipColor(clip.color))
                    .overlay {
                        Image(ClipItem.getClipBackgroundShape(clip.design))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 55, height: 55)
                    }
                
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
            
            Divider()
            
        }
        .padding(.horizontal, 13)
        .frame(height: 70)
    }
}

struct NewClipButton: View {
    @State var showingSheet: Bool = false
    
    var body: some View {
        Button {
            showingSheet = true
        } label: {
            VStack {
                HStack {
                    EmptyBox(width: 55, height: 55)
                    
                    Text("새로운 클립 만들기")
                        .font(.listTitle)
                        .foregroundStyle(.greenMain100)
                        .padding(.leading, 15)
                    
                    Spacer()
                }
                .frame(height: 70)
                .padding(.horizontal, 25)
            }
        }
        .padding(.bottom, 10)
        .sheet(isPresented: $showingSheet){
            NavigationStack {
                AddClip()
                    .presentationDragIndicator(.visible)
            }
        }
    }
}
