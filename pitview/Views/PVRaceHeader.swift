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
            
            HStack() {
                Spacer()
                
                if let qualifying = race.qualifying {
                    PVSessionTimeView(
                        sessionName: "Qualifying",
                        compact: true,
                        date: DateUtils.formatDate(qualifying.date),
                        time: qualifying.time
                    )
                }
                
                Spacer()
                
                if let time = race.time, let date = race.date {
                    PVSessionTimeView(
                        sessionName: "Race",
                        compact: true,
                        date: DateUtils.formatDate(date),
                        time: time
                    )
                } 
                
                Spacer()
            }
        }
    }
}

#Preview {
    PVRaceHeader(race: MockData.mockRace)
}
