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
            
            PVSeasonsView()
                .tabItem { Label("Seasons", systemImage: "trophy") }
            
            PVDriversView()
                .tabItem { Label("Drivers", systemImage: "steeringwheel") }
            
            PVTracksView()
                .tabItem { Label("Tracks", systemImage: "road.lanes.curved.right") }
        }
        .tint(.hotRed)
    }
}

#Preview {
    PVTabView()
}
