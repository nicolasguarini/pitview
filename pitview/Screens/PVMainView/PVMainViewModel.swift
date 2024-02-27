//
//  PVMainViewModel.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

@MainActor final class PVMainViewModel: ObservableObject {
    @Published var season: SeasonData = SeasonData(season: "", raceNames: [""])
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getSeason() {
        isLoading = true
        
        Task {
            do {
                season = try await NetworkManager.shared.getCurrentSeason()
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
