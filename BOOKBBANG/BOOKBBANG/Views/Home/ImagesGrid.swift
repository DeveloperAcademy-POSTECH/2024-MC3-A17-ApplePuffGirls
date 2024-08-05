//
//  ImagesGrid.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/31/24.
//

import SwiftUI
import WaterfallGrid

struct ImagesGrid: View {
    
    @Binding var images: [String] 
    @Binding var settings: SettingImageGrid
    
    var body: some View {
        let scrollDirection: Axis.Set = settings.scrollDirection == .vertical ? .vertical : .horizontal

        #if os(iOS) && !targetEnvironment(macCatalyst)

        return
            ScrollView(scrollDirection, showsIndicators: settings.showsIndicators) {
                WaterfallGrid((images), id: \.self) { image in
                    NavigationLink(destination: {
                        DetailBook()
                    }, label: {
                        fetchHomeImage(url: image)
                    })
                    
                }
                .gridStyle(
                    columnsInPortrait: Int(settings.columnsInPortrait),
                    columnsInLandscape: Int(settings.columnsInLandscape),
                    spacing: CGFloat(settings.spacing),
                    animation: nil //animation: settings.animation
                )
                .scrollOptions(direction: scrollDirection)
                .padding(settings.padding)
            }

        #else

        return
            ScrollView(scrollDirection, showsIndicators: settings.showsIndicators) {
                WaterfallGrid((images), id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .gridStyle(
                    columns: Int(settings.columns),
                    spacing: CGFloat(settings.spacing)//,
                    //animation: settings.animation
                )
                .scrollOptions(direction: scrollDirection)
                .padding(settings.padding)
            }

        #endif

    }
}

//#Preview {
//    ImagesGrid()
//}
