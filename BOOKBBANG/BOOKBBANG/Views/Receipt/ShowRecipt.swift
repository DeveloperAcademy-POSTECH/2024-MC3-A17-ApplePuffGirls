//
//  ShowRecipt.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/5/24.
//

import SwiftUI

// 빵수증이 있을 때
struct ShowRecipt: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.registerDate, ascending: false)],
        animation: .default)
    private var books: FetchedResults<Book>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>
    
    @Binding var rankedBooks: [Book]
    
    var mostAddedBooks: [Book] {
        return Array(books.sorted { $0.phraseCount > $1.phraseCount }.prefix(3))
    }
    
    var mostAddedClips: [Clip] {
        return Array(clips.sorted { $0.phrases?.count ?? 0 > $1.phrases?.count ?? 0 }.prefix(3))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                SelectDate()
                TwoLineDivider()
                
                // 기간동안 읽은 책, 가장 많이 읽은 장르
                VStack(spacing: 15) {
                    HStack {
                        Text("기간 동안 읽은 책")
                            .font(.segment)
                            .foregroundStyle(.typo50)
                        Spacer()
                        Text("\(books.count) 권")
                            .font(.segmentSelected)
                            .foregroundStyle(.typo80)
                    }
                    
                    HStack {
                        Text("가장 많이 읽은 장르")
                            .font(.segment)
                            .foregroundStyle(.typo50)
                        Spacer()
                        Text("추리/미스테리")
                            .font(.segmentSelected)
                            .foregroundStyle(.typo80)
                    }
                }
                .frame(width: 300)
                
                TwoLineDivider()
                
                Text("가장 인상 깊은 책 \(rankedBooks.count) 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                
                DashLineDivider()
                
                VStack(spacing: 15) {
                    
                    ForEach(Array(rankedBooks.enumerated()), id: \.element.id) { index, book in
                        HStack {
                            Text("\(book.name ?? "No title")")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(index + 1)위")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }

                }
                .frame(width: 300)
                
                // 책 이미지 3개
                HStack(spacing: 36) {
                    ForEach(rankedBooks) { book in
                        fetchReceiptImage(url: book.thumbnail ?? "")
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                
                TwoLineDivider()
                
                Text("가장 빵을 많이 구운 책 \(mostAddedBooks.count) 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                DashLineDivider()
                
                VStack(spacing: 15) {
                    ForEach(mostAddedBooks) { book in
                        HStack {
                            Text(book.name ?? "No title")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(book.phraseCount)개")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                .frame(width: 300)
                
                // 책 이미지 3개
                HStack(spacing: 36) {
                    ForEach(mostAddedBooks) { book in
                        fetchReceiptImage(url: book.thumbnail ?? "")
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                
                DashLineDivider()
                Text("가장 빵을 많이 담은 클립 \(mostAddedClips.count) 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                DashLineDivider()
                
                VStack(spacing: 15) {
                    ForEach(mostAddedClips) { clip in
                        HStack {
                            // 클립 이미지
                            Image(ClipItem.allCases[Int(clip.design)].clipImageName)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Colors.allCases[Int(clip.color)].color)
                                .frame(height: 20)
                            
                            Text(clip.title ?? "No title")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(clip.phrases?.count ?? 0)개")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                .frame(width: 300)
                .padding(.bottom, 30)
                
                TwoLineDivider()
                
                Text("독서의 진정한 기쁨은 몇번이고 그것을 되풀이하여 읽는 데 있다.\n- D. H 로랜스 -\n\n책빵이 그 기쁨을 도와주는 앱이 되길 기원합니다.")
                    .multilineTextAlignment(.center)
                    .font(.addBookButton)
                    .foregroundStyle(.typo80)
                    .padding(.vertical, 50)
                
                
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
    }
}
