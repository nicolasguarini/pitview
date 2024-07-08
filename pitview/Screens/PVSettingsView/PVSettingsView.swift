//
//  PVTracksView.swift
//  PitView
//
//  Created by Nicolas Guarini on 24/02/24.
//

import SwiftUI

struct PVSettingsView: View {
    @StateObject var viewModel = PVSettingsViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Season")) {
                    Picker("Selected Season", selection: $viewModel.selectedSeason) {
                        ForEach((1950...2024).reversed().map { String($0) }, id: \.self) { year in
                            Text(year).tag(year)
                        }
                    }
                }
                
                Section {
                    Label("Follow me on GitHub", systemImage: "link")
                }
                .foregroundColor(.primary)
                .font(.system(size: 16, weight: .semibold))
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    PVSettingsView()
}
