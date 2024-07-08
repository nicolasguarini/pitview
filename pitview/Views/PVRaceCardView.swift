//
//  PVRaceCardView.swift
//  PitView
//
//  Created by Nicolas Guarini on 08/07/24.
//

import SwiftUI

struct PVRaceCardView: View {
    let race: Race
    
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

                }
            }.frame(maxWidth: .infinity).padding().border(.secondary, cornerRadius: 10).foregroundColor(.primary)
        }
    }
}

#Preview {
    PVRaceCardView(race: MockData.mockRace)
}
