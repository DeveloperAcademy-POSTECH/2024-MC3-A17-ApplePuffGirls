//
//  ShowRecipt.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/5/24.
//

import SwiftUI

// 빵수증이 있을 때
struct ShowReceipt: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var selectedDate: DateRange
    var receipt: Receipt
    
    var rankedBooks: [RankedBook] {
        Array(receipt.rankedBooks?.allObjects as? [RankedBook] ?? []).sorted { $0.rank < $1.rank }
    }
    
    var topQuotedBooks: [TopQuotedBook] {
        Array(receipt.topQuotedBooks?.allObjects as? [TopQuotedBook] ?? []).sorted { $0.rank < $1.rank }
    }
    
    var topQuotedClips: [TopQuotedClip] {
        Array(receipt.topQuotedClips?.allObjects as? [TopQuotedClip] ?? []).sorted { $0.rank < $1.rank }
    }
    
    @State private var showingAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TwoLineDivider()
                
                // 기간동안 읽은 책, 가장 많이 읽은 장르
                VStack(spacing: 15) {
                    HStack {
                        Text("기간 동안 읽은 책")
                            .font(.segment)
                            .foregroundStyle(.typo50)
                        Spacer()
                        Text("\(receipt.bookCount) 권")
                            .font(.segmentSelected)
                            .foregroundStyle(.typo80)
                    }
                    
                    HStack {
                        Text("가장 많이 읽은 장르")
                            .font(.segment)
                            .foregroundStyle(.typo50)
                        Spacer()
                        Text(receipt.mostGenre ?? "Unknown")
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
                    ForEach(rankedBooks, id: \.id) { rankedBook in
                        HStack {
                            Text("\(rankedBook.book?.name ?? "No title")")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(rankedBook.rank)위")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                .frame(width: 300)
                
                // 책 이미지 3개
                HStack(spacing: 36) {
                    ForEach(rankedBooks, id: \.id) { rankedBook in
                        fetchReceiptImage(url: rankedBook.book?.thumbnail ?? "")
                    }
                }
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 20, trailing: 0))
                
                TwoLineDivider()
                
                Text("가장 빵을 많이 구운 책 \(topQuotedBooks.count) 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                DashLineDivider()
                
                VStack(spacing: 15) {
                    ForEach(topQuotedBooks, id: \.id) { topQuotedBook in
                        HStack {
                            Text(topQuotedBook.book?.name ?? "No title")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(topQuotedBook.phraseCount)개")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                .frame(width: 300)
                
                // 책 이미지 3개
                HStack(spacing: 36) {
                    ForEach(topQuotedBooks, id: \.id) { topQuotedBook in
                        fetchReceiptImage(url: topQuotedBook.book?.thumbnail ?? "")
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                
                DashLineDivider()
                Text("가장 빵을 많이 담은 클립 \(topQuotedClips.count) 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                DashLineDivider()
                
                VStack(spacing: 15) {
                    ForEach(topQuotedClips, id: \.id) { topQuotedClip in
                        HStack {
                            // 클립 이미지
                            Image(ClipItem.getClipShape(topQuotedClip.clip?.design ?? 0))
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Colors.getClipColor(topQuotedClip.clip?.color ?? 0))
                                .frame(height: 20)
                            
                            Text(topQuotedClip.clip?.title ?? "No title")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(topQuotedClip.phraseCount)개")
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
                
                
                Button(role: .destructive) {
                    showingAlert = true
                } label: {
                    Text("삭제하기")
                        .font(.caption)
                }
                Spacer()
            }
            
        }
        .scrollIndicators(.hidden)
        .alert(Text("정말 삭제하시겠습니까?"), isPresented: $showingAlert, actions: {
            alertView
        }, message: { Text("되돌릴 수 없다네..~")})
    }
    
    @ViewBuilder
    private var alertView: some View {
        Button("앗 실수", role: .cancel) { }
        Button("정말루", role: .destructive) { deleteReceipt() }
    }
    
    private func deleteReceipt() {
        viewContext.delete(receipt)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
