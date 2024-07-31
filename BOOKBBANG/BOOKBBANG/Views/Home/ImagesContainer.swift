//
//  Copyright © 2019 Paolo Leonardi.
//
//  Licensed under the MIT license. See the LICENSE file for more info.
//

import SwiftUI

struct ImagesContainer: View {
    
    @State private var images = ["fish_1", "fish_2", "fish_3", "fish_4", "fish_6"]
    @State private var settings = SettingImageGrid.default()
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            ImagesGrid(images: $images, settings: $settings)
                //.padding(.horizontal, 22)
                
        }
    }
}

struct ImagesContainer_Previews: PreviewProvider {
    static var previews: some View {
        ImagesContainer()
    }
}
