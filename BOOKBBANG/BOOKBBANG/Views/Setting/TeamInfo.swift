//
//  TeamInfo.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct TeamInfo: View {
    let columns = [
        GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) {
                    Text("Team Members")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.greenMain100)
                        .kerning(-0.4)
                        .padding(.vertical, 20)
                    
                    HStack {
                        Spacer()
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(TeamMember.members, id: \.self) { member in
                                MemberCard(member: member)
                            }
                        }
                        Spacer()
                    }
                    
                    Image(.apple)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 62)
                        .padding(.top, 68)
                        .padding(.bottom, 34)
                    
                    Text("Apple Developer Academy @ POSTECH")
                        .font(.listTitle)
                        .foregroundStyle(.greenMain100)
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .background(.backLighter)
        .navigationTitle("책빵을 만든 사람들")
    }
}

struct MemberCard: View {
    var member: TeamMember
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("\(member.name)_profile")
                .resizable()
                .scaledToFit()
                .frame(width: 130)
                .padding(.bottom, 10)
            
            Text(member.name)
                .font(.memberName)
                .padding(.bottom, 10)
                .foregroundStyle(.typo100)
            
            Text(member.comment)
                .font(.memberComment)
                .foregroundStyle(.typo80)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 23)
        }
        .frame(width: 163, height: 267)
        .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
    }
}
