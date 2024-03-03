//
//  PVRaceView.swift
//  PitView
//
//  Created by Nicolas Guarini on 03/03/24.
//

import SwiftUI

struct PVRaceView: View {
    var race: Race
    
    var body: some View {
        NavigationView {
            VStack {
                Text(race.round)
                
                Text(race.date!)
                
                if race.time != nil {
                    Text(race.time!)
                }
            }
        }.navigationTitle(Text(race.raceName))
    }
}

