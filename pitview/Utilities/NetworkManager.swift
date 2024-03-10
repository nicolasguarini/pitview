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
    
    func getCurrentSeason() async throws -> Season {
        guard let url = URL(string: NetworkManager.currentSeasonURL) else {
            throw PVError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ErgastResponse.self, from: data)
            let season = response.mrData.raceTable!.season
            let races = response.mrData.raceTable!.races
            return Season(season: season, races: races)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            throw PVError.invalidData
        }
    }
    
    func getDriverStandings(season: String = "current") async throws -> [DriverStanding] {
        let driverStandingsURL = NetworkManager.baseURL + season + "/driverStandings.json"
        
        guard let url = URL(string: driverStandingsURL) else {
            throw PVError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ErgastResponse.self, from: data)
            let driverStandings = response.mrData.standingsTable!.standingsLists[0].driverStandings
            return driverStandings
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            throw PVError.invalidData
        }
    }
}
