//
//  PVLatestRaceView.swift
//  PitView
//
//  Created by Nicolas Guarini on 08/07/24.
//

import SwiftUI

struct PVLatestRaceView: View {
    let race: Race
    let raceResults: [DriverResult]
    
    var body: some View {
        NavigationLink(destination: PVRaceView(race: race)) {
            VStack(alignment: .leading, spacing: 14) {
                HStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Round " + race.round).font(.f1FontBold(size: 12))
                        Text(race.raceName).font(.f1FontBold(size: 22))
                        Text(race.circuit.circuitName).font(.f1FontRegular(size: 14))
                        Text(DateUtils.formatDate(race.date ?? "") + " - " + (race.time ?? "").dropLast(4) ).font(.f1FontRegular(size: 14))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(race.circuit.circuitId)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .clipped()
                }
                
                if raceResults.count >= 3 {
                    HStack {
                        VStack {
                            Text("2: " + raceResults[1].driver.code!)
                                .font(.f1FontBold(size: 16))
                                .padding(.top, 10)
                        }
                        Spacer()
                        VStack {
                            Text("1: " + raceResults[0].driver.code!)
                                .font(.f1FontBold(size: 18))
                                .padding(.top, 0)
                        }
                        Spacer()
                        VStack {
                            Text("3: " + raceResults[2].driver.code!)
                                .font(.f1FontBold(size: 16))
                                .padding(.top, 25)
                        }
                    }
                }
                
                
            }.frame(maxWidth: .infinity).padding().border(.secondary, cornerRadius: 10).foregroundColor(.primary)
        }
    }
}

#Preview {
    PVLatestRaceView(race: MockData.mockRace, raceResults: [MockData.mockDriverResult, MockData.mockDriverResult, MockData.mockDriverResult])
}
