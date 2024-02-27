//
//  NetworkManager.swift
//  PitView
//
//  Created by Nicolas Guarini on 26/02/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://ergast.com/api/f1/"
    static let currentSeasonURL = baseURL + "current.json"
    
    private init() {}
    
    func getCurrentSeason() async throws -> SeasonData {
        guard let url = URL(string: NetworkManager.currentSeasonURL) else {
            throw PVError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ErgastResponse.self, from: data)
            let season = response.MRData.RaceTable.season
            let raceNames = response.MRData.RaceTable.Races.map { $0.raceName }
            return SeasonData(season: season, raceNames: raceNames)
        } catch {
            throw PVError.invalidData
        }
    }
}
