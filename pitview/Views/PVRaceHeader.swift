//
//  PVRaceHeader.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/03/24.
//

import SwiftUI

struct PVRaceHeader: View {
    let race: Race
    
    var body: some View {
        VStack(spacing: 25) {
            PVSmallCircuitCard(circuit: race.circuit)
            
            HStack(spacing: 25) {
                if let qualifying = race.qualifying {
                    PVSessionTimeView(
                        sessionName: "Qualifying",
                        compact: false,
                        date: qualifying.date, 
                        time: qualifying.time
                    )
                }
                
                if let time = race.time, let date = race.date {
                    PVSessionTimeView(
                        sessionName: "Race",
                        compact: false,
                        date: date,
                        time: time
                    )
                }
            }
        }
    }
}

#Preview {
    PVRaceHeader(race: MockData.mockRace)
}
