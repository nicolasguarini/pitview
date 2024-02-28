//
//  StandingsTable.swift
//  PitView
//
//  Created by Nicolas Guarini on 28/02/24.
//

import Foundation

struct StandingsTable: Codable {
    let season: String
    let standingsLists: [DriverStandings]
    
    private enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}
