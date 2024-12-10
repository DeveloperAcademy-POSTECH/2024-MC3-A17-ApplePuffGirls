//
//  Root.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/4/24.
//

import SwiftUI

struct Root: View {
    @ObservedObject var viewModel: RootViewModel = RootViewModel()
    @ObservedObject var homeViewModel: HomeViewModel = HomeViewModel()
    @ObservedObject var detailBookViewModel: DetailBookViewModel = DetailBookViewModel()
    
    var body: some View {
        ZStack {
            switch viewModel.currentView {
            case .home:
                Home(homeViewModel: homeViewModel,
                     detailBookViewModel: detailBookViewModel)
            }
        }
    }
}
