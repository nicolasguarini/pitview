//
//  PVSettingsViewModel.swift
//  PitView
//
//  Created by Nicolas Guarini on 08/07/24.
//

import Foundation

@MainActor final class PVSettingsViewModel: ObservableObject {
    @Published var selectedSeason: String {
        didSet {
            UserDefaults.standard.set(selectedSeason, forKey: "selectedSeason")
        }
    }

    init() {
        self.selectedSeason = UserDefaults.standard.string(forKey: "selectedSeason") ?? "2024"
    }
}
