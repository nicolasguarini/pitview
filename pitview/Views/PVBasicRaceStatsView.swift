//
//  PVBasicRaceStatsView.swift
//  PitView
//
//  Created by Nicolas Guarini on 02/04/24.
//

import SwiftUI

struct PVBasicRaceStatsView: View {
    let results: [DriverResult]
    
    var body: some View {
        HStack {
            Spacer()
            if let laps = RaceUtils.calculateMaxLaps(driverResults: results) {
                HStack {
                    Text(String(laps)).font(.f1FontBold(size: 28))
                    Text("LAPS").font(.f1FontRegular(size: 18))
                }
                
            }
            Spacer()
            if let averageSpeed = RaceUtils.calculateAverageSpeed(driverResults: results) {
                VStack(spacing: 7) {
                    Text("Avg. Speed").font(.f1FontRegular(size: 16))
                    Text(String(averageSpeed) + " kph").font(.f1FontBold(size: 24))
                }
            }
            Spacer()
        }
    }
}
