//
//  DateFormatter+.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/30/24.
//

import Foundation


extension DateFormatter {
    
    static let customFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd"
        return dateFormatter
        
    }()
}
