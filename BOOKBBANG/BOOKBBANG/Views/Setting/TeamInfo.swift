//
//  TeamInfo.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI



struct TeamInfo: View {
    
    let columns = [
        GridItem(.flexible()), GridItem(.flexible())
        ]
    
    var body: some View {
        
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false), navigationType: .chevron, title: "Apple Puff Girls에 대해")
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    Image(.teamLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 235, height: 163)
                        .padding(.top, 50)
                    
                    Text("Team Members")
                        .font(.teamMemberTitle)
                        .foregroundStyle(.greenMain100)
                        .padding(.top, 68)
                        .padding(.bottom, 31)
                    
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(TeamMember.members, id: \.self) { member in
                            MemberCard(member: member)
                        }
                    }
                    
                    Text("Team Mentors")
                        .font(.teamMemberTitle)
                        .foregroundStyle(.greenMain100)
                        .padding(.top, 68)
                        .padding(.bottom, 31)
                    
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(TeamMember.mentors, id: \.self) { member in
                            MemberCard(member: member)
                        }
                    }
                    
                    Image(.appleLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 62)
                        .padding(.top, 120)
                        .padding(.bottom, 34)
                    Text("Apple Developer Academy @ POSTECH")
                        .font(.listTitle)
                        .foregroundStyle(.greenMain100)
                        .padding(.bottom, 20)
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .background(.backLighter)
    }
}

#Preview {
    NavigationStack {
        TeamInfo()
    }
}

struct MemberCard: View {
    var member: TeamMember
    
    var body: some View {
        VStack(spacing: 19) {
            Image(member.name+"_profile")
                .resizable()
                .scaledToFit()
                .frame(width: 119)
            
            Text(member.name)
                .font(.memberName)
            VStack(spacing: 0) {
                Text(member.comment)
                    .font(.memberComment)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(width: 140, height: 65)
        }
        .padding(15)
        .foregroundStyle(.typo100)
        .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
    }
}
