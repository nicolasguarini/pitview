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
                    VStack(spacing: 7) {
                        Text("Qualifying").font(.f1FontBold(size: 18)).padding(1)
                        
                        HStack {
                            Text(qualifying.date).font(.f1FontRegular(size: 16))
                            Text(TimeUtils.convertTime(qualifying.time) ?? qualifying.time).font(.f1FontRegular(size: 16))
                        }
                        
                    }
                }
                
                if let time = race.time, let date = race.date {
                    VStack(spacing: 7){
                        Text("Race").font(.f1FontBold(size: 18)).padding(1)
                        
                        HStack {
                            Text(date).font(.f1FontRegular(size: 16))
                            Text(TimeUtils.convertTime(time) ?? time).font(.f1FontRegular(size: 16))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PVRaceHeader(race: MockData.mockRace)
}
