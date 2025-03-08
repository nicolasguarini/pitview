//
//  NetworkManager.swift
//  PitView
//
//  Created by Nicolas Guarini on 26/02/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    //static let baseURL = "https://ergast.com/api/f1/"
    static let baseURL = "http://api.jolpi.ca/ergast/f1/"
    
    private init() {}
    
    func getSeason(season: String = "current") async throws -> Season {
        guard let url = URL(string: NetworkManager.baseURL + season + ".json") else {
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
            print("Error decoding JSON: \(error)")
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
            let driverStandings = response.mrData.standingsTable!.standingsLists[0].driverStandings!
            return driverStandings
        } catch {
            print("Error decoding JSON: \(error)")
            throw PVError.invalidData
        }
    }
    
    func getConstructorStandings(season: String = "current") async throws -> [ConstructorStanding] {
        let constructorStandingsURL = NetworkManager.baseURL + season + "/constructorStandings.json"
        
        guard let url = URL(string: constructorStandingsURL) else {
            throw PVError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ErgastResponse.self, from: data)
            let constructorStandings = response.mrData.standingsTable!.standingsLists[0].constructorStandings!
            return constructorStandings
        } catch {
            print("Error decoding JSON: \(error)")
            throw PVError.invalidData
        }
    }
    
    func getRaceReults(season: String = "current", round: String) async throws -> [DriverResult] {
        let raceResultsURL = NetworkManager.baseURL + season + "/" + round + "/results.json"
        
        guard let url = URL(string: raceResultsURL) else {
            throw PVError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ErgastResponse.self, from: data)
            let races = response.mrData.raceTable?.races
            
            if races!.isEmpty {
               return []
            }
            
            let raceResuts = races![0].results
            return raceResuts!
        } catch {
            print("Error decoding JSON: \(error)")
            throw PVError.invalidData
        }
    }
}
