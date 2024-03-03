//
//  Race.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

struct Race: Codable {
    let raceName: String
    let round: String
    let season: String
    let date: String?
    let time: String?
    let circuit: Circuit
    
    private enum CodingKeys: String, CodingKey {
        case raceName
        case round
        case season
        case date
        case time
        case circuit = "Circuit"
    }
}
