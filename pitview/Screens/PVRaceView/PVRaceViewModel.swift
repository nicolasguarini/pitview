//
//  PVRaceViewModel.swift
//  PitView
//
//  Created by Nicolas Guarini on 28/03/24.
//

import Foundation

@MainActor final class PVRaceViewModel: ObservableObject {
    @Published var results: [DriverResult] = [MockData.mockDriverResult]
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getResults(season: String, round: String) {
        isLoading = true
        
        Task {
            do {
                results = try await NetworkManager.shared.getRaceReults(round: round)
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
