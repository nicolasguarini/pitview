//
//  PVSeasonProgressView.swift
//  PitView
//
//  Created by Nicolas Guarini on 07/07/24.
//

import SwiftUI

struct PVSeasonProgressView: View {
    let season: String
    let races: [Race]
    
    private var completedRaces: Int {
        return races.filter { RaceUtils.isRaceCompleted($0) }.count
    }
    
    private var totalRaces: Int {
        return races.count
    }
    
    private var progressPercentage: Int {
        guard totalRaces > 0 else { return 0 }
        return Int((Double(completedRaces) / Double(totalRaces)) * 100)
    }
    
    var body: some View {
        HStack {
            Text(season + " Season").font(.f1FontBold(size: 20))
            Spacer()
            VStack(alignment: .leading) {
                Text("\(progressPercentage)%").font(.f1FontBold(size: 20))
                Text("\(completedRaces)/\(totalRaces) GPs completed").font(.f1FontRegular(size: 12))
            }
        }.padding()
    }
}

#Preview {
    PVSeasonProgressView(season: "2024", races: [MockData.mockRace, MockData.mockRace])
}
