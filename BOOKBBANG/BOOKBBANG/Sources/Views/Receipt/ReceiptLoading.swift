//
//  ReceiptLoading.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 10/10/24.
//

import SwiftUI

struct ReceiptLoading: View {
    @State private var currentImageIndex: Int = 0
    @State private var rotationAngle: Double = 0
    let images = ["bread1", "bread2", "bread3", "bread4", "bread5", "bread6", "bread7", "bread8"]
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.backLighter.ignoresSafeArea()
            
            GeometryReader { geometry in
                ForEach(0..<images.count, id: \.self) { index in
                    let angle = Double(index) * (360 / Double(images.count))
                    let radius: CGFloat = 140
                    
                    let x = radius * cos((angle + rotationAngle) * .pi / 180)
                    let y = radius * sin((angle + rotationAngle) * .pi / 180)
                    
                    Image(images[index])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 65)
                        .position(x: geometry.size.width / 2 + x, y: geometry.size.height / 2 + y)
                        //.rotationEffect(.degrees(0))
                }
            }
            .onReceive(timer) { _ in
                withAnimation(.linear(duration: 0.4)) {
                    rotationAngle += 15
                }
            }
            
            Text("빵수증이 출력 중이에요")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.typo80)
        }
    }
}

#Preview {
    ReceiptLoading()
}
