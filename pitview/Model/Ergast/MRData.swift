//
//  MRData.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

struct MRData: Codable {
    let raceTable: RaceTable?
    let standingsTable: StandingsTable?
    
    private enum CodingKeys: String, CodingKey {
        case raceTable = "RaceTable"
        case standingsTable = "StandingsTable"
    }
}

struct ErgastResponse: Codable {
    let mrData: MRData
    
    private enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}
