//
//  PVTracksView.swift
//  PitView
//
//  Created by Nicolas Guarini on 24/02/24.
//

import SwiftUI

struct PVSettingsView: View {
    @StateObject var viewModel = PVSettingsViewModel()
    let currentYear = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Season")) {
                    Picker("Selected Season", selection: $viewModel.selectedSeason) {
                        ForEach((1950...currentYear).reversed().map { String($0) }, id: \.self) { year in
                            Text(year).tag(year)
                        }
                    }
                }
                
                Section(header: Text("Useful Links")) {
                    Link(destination: URL(string: "https://github.com/nicolasguarini")!) {
                        Label("Follow me on GitHub", systemImage: "link")
                    }
                    .foregroundColor(.primary)
                    .font(.system(size: 16, weight: .semibold))
                    
                    Link(destination: URL(string: "https://nicolasguarini.it")!) {
                        Label("Visit my Website", systemImage: "link")
                    }
                    .foregroundColor(.primary)
                    .font(.system(size: 16, weight: .semibold))
                    
                    Link(destination: URL(string: "https://paypal.me/nicolasguarini")!) {
                        Label("Donate", systemImage: "link")
                    }
                    .foregroundColor(.primary)
                    .font(.system(size: 16, weight: .semibold))
                }
                
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    PVSettingsView()
}
