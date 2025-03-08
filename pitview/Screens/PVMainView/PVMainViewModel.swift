//
//  PVMainViewModel.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

@MainActor final class PVMainViewModel: ObservableObject {
    @Published var season: Season = MockData.mockSeason
    @Published var driverStandings: [DriverStanding] = [MockData.mockDriverStanding]
    @Published var constructorStandings: [ConstructorStanding] = [MockData.mockConstructorStanding]
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var selectedDriver: Driver? = MockData.mockDriver
    @Published var selectedConstructor: Constructor? = MockData.mockConstructor
    @Published var isShowingDriverDetails = false
    @Published var latestRace: Race? = nil
    @Published var latestRaceResults: [DriverResult] = []
    
    func getSeason() {
        isLoading = true
        let selectedSeason = UserDefaults.standard.string(forKey: "selectedSeason") ?? "current"
        
        Task {
            do {
                season = try await NetworkManager.shared.getSeason(season: selectedSeason)
                driverStandings = try await NetworkManager.shared.getDriverStandings(season: selectedSeason)
                constructorStandings = try await NetworkManager.shared.getConstructorStandings(season: selectedSeason)
                latestRace = RaceUtils.getLastCompletedRace(from: season.races)
                
                if latestRace != nil {
                    let round = Int(self.latestRace!.round)
                    latestRaceResults = try await NetworkManager.shared.getRaceReults(season: selectedSeason, round: String(round!))
                    
                    /* Uncomment if you want to display the latest race with results, even if that's not the actual last race
                    while latestRaceResults.isEmpty && round! >= 1 {
                        latestRaceResults = try await NetworkManager.shared.getRaceReults(season: selectedSeason, round: String(round!))
                        round! -= 1
                    }
                    
                    if latestRace?.round != String(round!) {
                        latestRace = season.races[Int(round!)]
                    }
                     */
                }

                isLoading = false
            } catch {
                if let pvError = error as? PVError {
                    switch pvError {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
