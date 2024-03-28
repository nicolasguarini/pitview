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
        dateFormatter.dateFormat = "HH:mm:ssZ" // Formato di input
        
        guard let date = dateFormatter.date(from: timeString) else {
            return nil // Errore nel parsing della data
        }
        
        dateFormatter.dateFormat = "HH:mm" // Formato di output senza indicazione AM/PM
        return dateFormatter.string(from: date)
    }
}
