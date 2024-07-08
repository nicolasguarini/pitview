//
//  PVEventsViewModel.swift
//  PitView
//
//  Created by Nicolas Guarini on 08/07/24.
//

import Foundation

@MainActor final class PVScheduleViewModel: ObservableObject {
    @Published var season: Season = MockData.mockSeason
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var latestRace: Race? = nil
    
    func getSeason() {
        isLoading = true
        
        Task {
            do {
                season = try await NetworkManager.shared.getCurrentSeason()
                
                latestRace = RaceUtils.getLastCompletedRace(from: season.races)
                
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
