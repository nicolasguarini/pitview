//
//  DateUtils.swift
//  PitView
//
//  Created by Nicolas Guarini on 01/04/24.
//

import Foundation

class DateUtils {
    static func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd MMM"
            return dateFormatter.string(from: date)
        } else {
            return dateString
        }
    }
}
