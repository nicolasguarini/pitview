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
        let currentYear = Calendar.current.component(.year, from: Date())
        self.selectedSeason = UserDefaults.standard.string(forKey: "selectedSeason") ?? "\(currentYear)"
    }
}
