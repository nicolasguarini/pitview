//
//  PVTabView.swift
//  PitView
//
//  Created by Nicolas Guarini on 24/02/24.
//

import SwiftUI

struct PVTabView: View {
    var body: some View {
        TabView {
            PVMainView()
                .tabItem { Label("Home", systemImage: "house") }
            
            PVStandingsView ()
                .tabItem { Label("Standings", systemImage: "chart.bar.fill") }
            
            PVDriversView()
                .tabItem { Label("Events", systemImage: "calendar") }
            
            PVTracksView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }.tint(.hotRed)
    }
}

#Preview {
    PVTabView()
}
