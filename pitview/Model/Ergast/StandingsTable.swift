//
//  StandingsTable.swift
//  PitView
//
//  Created by Nicolas Guarini on 28/02/24.
//

import Foundation

struct StandingsTable: Codable {
    let season: String
    let standingsLists: [StandingsList]
    
    private enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

struct StandingsList: Codable {
    let season: String
    let round: String
    let driverStandings: [DriverStanding]?
    let constructorStandings: [ConstructorStanding]?
    
    private enum CodingKeys: String, CodingKey {
        case season
        case round
        case driverStandings = "DriverStandings"
        case constructorStandings = "ConstructorStandings"
    }
}
