//
//  RaceTab le.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

struct RaceTable: Codable {
    let season: String
    let races: [Race]
    
    private enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}
