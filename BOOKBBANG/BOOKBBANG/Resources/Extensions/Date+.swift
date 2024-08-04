//
//  Date+.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/4/24.
//

import SwiftUI

extension Date {
    init?(y year: Int, m month: Int, d day: Int) {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        guard let date = Calendar.current.date(from: components) else {
            return nil
        }
        
        self = date
    }
}