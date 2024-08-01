//
//  TeamInfo.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct TeamMember: Hashable {
    var name: String
    var comment: String
}

struct TeamInfo: View {
    
    let members: [TeamMember] = [
        TeamMember(name: "Jerrie", comment: "말도 안되는 걸 참을 수 없어! 내가 말이 될 때까지 때려서 고쳐줄게!"),
        TeamMember(name: "Guryss", comment: "난 사실 책을 읽지 않는데, 어쩌다 보니 책빵을 만들고 있더라고..."),
        TeamMember(name: "Gimli", comment: "그냥 참을 수 없어! 고양이 빼고 다 비켜!"),
        TeamMember(name: "Dada", comment: "찍먹 나쵸를 먹고 싶니? 그렇지만 내가 이미 다 먹었어."),
        TeamMember(name: "Rochelle", comment: "야구 팀이 언제 이기는지 궁금해? 그건 나도 알고 싶어...")
    ]
    
    let mentors: [TeamMember] = [
        TeamMember(name: "Rinda", comment: "사실 나도 칭찬스티커\n를 많이 받고싶어.."),
        TeamMember(name: "Jason", comment: "오우 여러분과 함께라면 뭐든 좋와요우!")]
    
    let columns = [
        GridItem(.flexible()), GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                Image("TeamLogo")
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
                    ForEach(members, id: \.self) { member in
                        MemberCard(member: member)
                    }
                }
                
                Text("Team Mentors")
                    .font(.teamMemberTitle)
                    .foregroundStyle(.greenMain100)
                    .padding(.top, 68)
                    .padding(.bottom, 31)
                
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(mentors, id: \.self) { member in
                        MemberCard(member: member)
                    }
                }
                
                Image("AppleLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 62)
                    .padding(.top, 120)
                    .padding(.bottom, 34)
                Text("Apple Developer Academy @ POSTECH")
                    .font(.listTitle)
                    .foregroundStyle(.greenMain100)
            }
            .padding()
        }
        .background(.backLighter)
        .scrollIndicators(.hidden)
        .navigationTitle("Apple Puff Girls에 대해")
        .navigationBarTitleDisplayMode(.inline)
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
        //.frame(width: 169)
        .padding(15)
        .foregroundStyle(.typo100)
        .background(RoundedRectangle(cornerRadius: 20).stroke(.typo25))
    }
}
