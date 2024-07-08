//
//  PVNextRaceView.swift
//  PitView
//
//  Created by Nicolas Guarini on 08/07/24.
//

import SwiftUI

struct PVNextRaceView: View {
    let race: Race
    
    var body: some View {
        NavigationLink(destination: PVRaceView(race: race)) {
            VStack(alignment: .leading, spacing: 14) {
                HStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Round " + race.round).font(.f1FontBold(size: 12))
                        Text(race.raceName).font(.f1FontBold(size: 16))
                        Text(race.date ?? "").font(.f1FontRegular(size: 14))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    
                    
                    let timeRemaining = DateUtils.timeUntil(RaceUtils.getRaceDateTime(race: race)!)
                    
                    VStack(alignment: .leading) {
                        Text("Race starts in:").font(.f1FontRegular(size: 12))
                        HStack(spacing: 30) {
                            VStack(alignment: .leading) {
                                Text(String(timeRemaining.days)).font(.f1FontBold(size: 32))
                                Text("Days")
                            }
                            
                            VStack(alignment: .leading) {
                                Text(String(timeRemaining.hours)).font(.f1FontBold(size: 32))
                                Text("Hours")
                            }
                        }
                    }
                    
                }
                
            }.frame(maxWidth: .infinity).padding().border(.secondary, cornerRadius: 10).foregroundColor(.primary)
        }
    }
}

#Preview {
    PVNextRaceView(race: MockData.mockRace)
}
