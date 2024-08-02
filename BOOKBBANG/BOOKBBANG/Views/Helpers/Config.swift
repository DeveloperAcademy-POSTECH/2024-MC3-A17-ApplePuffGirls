//
//  Config.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/1/24.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let apiKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}
