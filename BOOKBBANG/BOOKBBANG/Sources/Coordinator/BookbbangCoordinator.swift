//
//  BookbbangCoordinator.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 12/6/24.
//

import Foundation
import SwiftUI

final class BookbbangCoordinator: BaseCoordinator<BookbbangRoute, BookbbangSheet, BookbbangFullScreenOver> {
    @ViewBuilder
    func build(_ route: BookbbangRoute) -> some View {
        switch route {
        case .createBook: AddBook()
        case .bookDetail: DetailBook()
        case .clipDetail: DetailClip()
        case .receipt: ReceiptMain()
        case .setting: Setting()
        }
    }
    
    @ViewBuilder
    func buildSheet(_ sheet: BookbbangSheet) -> some View {
        switch sheet {
        case .createClip: AddClip()
        }
    }
    
    @ViewBuilder
    func buildFullScreenOver(_ fullScreenOver: BookbbangFullScreenOver) -> some View {
        switch fullScreenOver {
        case .dummy: EmptyView()
        }
    }
}
