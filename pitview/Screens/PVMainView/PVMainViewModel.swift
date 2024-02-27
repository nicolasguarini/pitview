//
//  PVMainViewModel.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

@MainActor final class PVMainViewModel: ObservableObject {
    @Published var season: SeasonData = SeasonData(season: "", raceNames: [""])
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
                        print("Invalid data")
                    case .invalidURL:
                        print("Invalid URL")
                    }
                } else {
                    print("generic error")
                }
            }
        }
    }
}
