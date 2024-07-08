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
    
    static func timeUntil(_ futureDate: Date) -> (days: Int, hours: Int, minutes: Int) {
        let currentDate = Date()
        
        if futureDate <= currentDate {
            return (0, 0, 0)
        }
        
        let components = Calendar.current.dateComponents([.day, .hour, .minute], from: currentDate, to: futureDate)
        
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        
        return (days, hours, minutes)
    }

}
