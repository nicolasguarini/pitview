//
//  TimeUtils.swift
//  PitView
//
//  Created by Nicolas Guarini on 28/03/24.
//

import Foundation

class TimeUtils {
    static func convertTime(_ timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ssZ"
        
        guard let date = dateFormatter.date(from: timeString) else {
            return nil
        }
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
