//
//  PVStandingsViewModel.swift
//  PitView
//
//  Created by Nicolas Guarini on 08/07/24.
//

import Foundation

@MainActor final class PVStandingsViewModel: ObservableObject {
    @Published var driverStandings: [DriverStanding] = [MockData.mockDriverStanding]
    @Published var constructorStandings: [ConstructorStanding] = [MockData.mockConstructorStanding]
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var selectedDriver: Driver? = nil
    @Published var selectedConstructor: Constructor? = nil
    @Published var isShowingDriverDetails = false
    
    func getStandings() {
        isLoading = true
        let selectedSeason = UserDefaults.standard.string(forKey: "selectedSeason") ?? "current"
        
        Task {
            do {
                driverStandings = try await NetworkManager.shared.getDriverStandings(season: selectedSeason)
                constructorStandings = try await NetworkManager.shared.getConstructorStandings(season: selectedSeason)
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
