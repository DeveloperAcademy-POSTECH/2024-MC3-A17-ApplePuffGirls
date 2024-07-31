//
//  AddClip.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddClip: View {
  @ObservedObject var clipData: ClipData
  
  let nameLimit = 13
  let descriptionLimit = 25
  
  let shapeImages = [
    "WaterDropShape", "TwinkleShape", "SunShape", "StarShape",
    "AppleShape", "FlowerShape", "HeartShape", "CloverShape"
  ]
  
  let clipImages = [
    "WaterDropClip", "TwinkleClip", "SunClip", "StarClip",
    "AppleClip", "FlowerClip", "HeartClip", "CloverClip"
  ]
  
  let colors = [
    Color.clipRed, Color.clipYellow, Color.clipOrange, Color.clipGreen,
    Color.clipBlue, Color.clipPurple, Color.clipPink, Color.clipSky
  ]
  
  var body: some View {
    NavigationView {
      VStack {
        Image(clipData.selectedShape != nil ? clipImages[clipData.selectedShape!] : "WaterDropClip")
          .renderingMode(.template)
          .resizable()
          .frame(width: 115, height: 110)
          .padding(.top, 40)
          .foregroundColor(clipData.selectedColor != nil ? colors[clipData.selectedColor!] : .clipRed)
        
        Text("기본 정보")
          .font(.system(size: 12))
          .padding(.top, 30)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 22)
        
        TextField("클립 제목을 입력해주세요", text: $clipData.name)
          .onChange(of: clipData.name) { newValue in
            if newValue.count > nameLimit {
              clipData.name = String(newValue.prefix(nameLimit))
            }
          }
          .frame(width: 330, height: 18)
          .padding()
          .background(Color.typo10)
          .cornerRadius(10)
        
        TextField("클립에 대한 설명을 입력해주세요", text: $clipData.description)
          .onChange(of: clipData.description) { newValue in
            if newValue.count > descriptionLimit {
              clipData.description = String(newValue.prefix(descriptionLimit))
            }
          }
          .frame(width: 330, height: 18)
          .padding()
          .background(Color.typo10)
          .cornerRadius(10)
        
        Text("클립 디자인")
          .font(.system(size: 12))
          .padding(.top, 20)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 22)
        
        VStack(spacing: 12) {
          HStack(spacing: 12) {
            ForEach(0..<4) { index in
              Button(action: {
                clipData.selectedShape = index
              }) {
                RoundedRectangle(cornerRadius: 10)
                  .strokeBorder(clipData.selectedShape == index ? Color.greenMain100 : Color.typo10, lineWidth: clipData.selectedShape == index ? 4 : 1)
                  .background(
                    Image(shapeImages[index])
                      .resizable()
                      .scaledToFit()
                      .padding(12)
                  )
                  .frame(width: 80, height: 80)
              }
            }
          }
          
          HStack(spacing: 12) {
            ForEach(4..<8) { index in
              Button(action: {
                clipData.selectedShape = index
              }) {
                RoundedRectangle(cornerRadius: 10)
                  .strokeBorder(clipData.selectedShape == index ? Color.greenMain100 : Color.typo10, lineWidth: clipData.selectedShape == index ? 4 : 1)
                  .background(
                    Image(shapeImages[index])
                      .resizable()
                      .scaledToFit()
                      .padding(12)
                  )
                  .frame(width: 80, height: 80)
              }
            }
          }
        }
        .padding(.top, 5)
        
        Text("색상")
          .font(.system(size: 12))
          .padding(.top, 20)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 22)
        
        HStack(spacing: 12) {
          ForEach(0..<8) { index in
            Button(action: {
              clipData.selectedColor = index
            }) {
              Rectangle()
                .fill(colors[index])
                .frame(width: 33, height: 35)
                .cornerRadius(5)
                .overlay(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(clipData.selectedColor == index ? Color.greenMain100 : Color.clear, lineWidth: clipData.selectedColor == index ? 4 : 0)
                )
            }
          }
        }
        
        Spacer()
      }
      
      .navigationBarTitle("새로운 클립 추가", displayMode: .inline)
      .navigationBarItems(
        leading: Button(action: {
        }) {
          Text("취소")
            .foregroundColor(.greenMain100)
            .padding(.leading, 10)
        },
        trailing: Button(action: {
        }) {
          Text("저장")
            .foregroundColor(.greenMain100)
            .padding(.trailing, 10)
        }
      )
    }
  }
}

#Preview {
  AddClip(clipData: ClipData())
}
