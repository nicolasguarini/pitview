//
//  ColorCodes.swift
//  PitView
//
//  Created by Nicolas Guarini on 17/03/24.
//

import Foundation

class TeamColorCodes {
    static func getColorCode(for teamId: String) -> String? {
        let teamIdToColorCode: [String: String] = [
            "mercedes": "27F4D2",
            "red_bull": "3671C6",
            "ferrari": "E8002D",
            "mclaren": "FF8000",
            "alpine": "FF87BC",
            "rb": "6692FF",
            "aston_martin": "229971",
            "williams": "64C4FF",
            "sauber": "52E252",
            "haas": "B6BABD"
        ]
        
        return teamIdToColorCode[teamId]
    }
}
