//
//  DetailClip.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct DetailClip: View {
    @ObservedObject var clipData: ClipData
    @State private var showingEditClip = false
    
    let clipImages = [
        "WaterDropClip", "TwinkleClip", "SunClip", "StarClip",
        "AppleClip", "FlowerClip", "HeartClip", "CloverClip"
    ]
    
    let colors = [
        Color.red, Color.yellow, Color.orange,
        Color.green, Color.blue, Color.purple, Color.pink, Color.gray
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Image(clipData.selectedShape != nil ? clipImages[clipData.selectedShape!] : "WaterDropClip")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 50)
                    .foregroundColor(clipData.selectedColor != nil ? colors[clipData.selectedColor!] : .clipRed)
                
                Text(clipData.name.isEmpty ? "제목을 입력하세요" : clipData.name)
                    .font(.system(size: 24))
                    .padding(.top, 15)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text(clipData.description.isEmpty ? "설명을 입력하세요" : clipData.description)
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
            .navigationBarTitle("클립 상세정보", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    // 여기에 뒤로 가기 액션 추가 가능
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.greenMain100)
                        .padding(.leading, 10)
                },
                trailing: Button(action: {
                    showingEditClip = true
                }) {
                    Text("수정")
                        .foregroundColor(.greenMain100)
                        .padding(.trailing, 10)
                }
            )
        }
        .sheet(isPresented: $showingEditClip) {
            EditClip(clipData: clipData)
        }
    }
}

#Preview {
    DetailClip(clipData: ClipData())
}
