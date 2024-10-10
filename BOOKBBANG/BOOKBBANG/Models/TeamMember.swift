//
//  TeamMember.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/2/24.
//

import Foundation

struct TeamMember: Hashable {
    var name: String
    var comment: String
    
    static let members: [TeamMember] = [
        TeamMember(name: "Jerrie", comment: "말도 안되는 걸 참을 수 없어 내가 말이 될 때까지 때려서 고쳐줄게"),
        TeamMember(name: "Guryss", comment: "난 사실 책을 읽지 않는데 어쩌다 보니 책빵을 만들고 있더라고"),
        TeamMember(name: "Gimli", comment: "그냥 참을 수 없어 고양이 빼고 다 비켜 다 비키라고"),
        TeamMember(name: "Rochelle", comment: "야구 팀이 대체 언제 이기는지 궁금해? 그건 나도 알고 싶어")
    ]
}
