//
//  PVRaceResultsListView.swift
//  PitView
//
//  Created by Nicolas Guarini on 02/04/24.
//

import SwiftUI

struct PVRaceResultsListView: View {
  let results: [DriverResult]

  var body: some View {
    VStack {
      ForEach(results, id: \.driver.driverId) { driverResult in
        HStack {
          Text(driverResult.position)

          Text(driverResult.driver.givenName + " " + driverResult.driver.familyName).font(
            .f1FontBold(size: 16))

          if driverResult.fastestLap?.rank == "1" {
            Image(systemName: "timer.circle.fill").foregroundStyle(.purple)
          }
            
            let startPosition: Int = Int(driverResult.grid) ?? 0
            let endPosition: Int = Int(driverResult.position) ?? 0

            let deltaPosition: Int = endPosition - startPosition

            if deltaPosition < 0 {
                HStack(spacing: 1) {
                    Image(systemName: "chevron.up")
                    Text(String(abs(deltaPosition)))
                }.foregroundStyle(.green).font(.f1FontRegular(size: 14))
            } else if deltaPosition > 0 {
                HStack(spacing: 1) {
                    Image(systemName: "chevron.down")
                    Text(String(deltaPosition))
                }.foregroundStyle(.red).font(.f1FontRegular(size: 14))
            }

          Spacer()
            
            if driverResult.time != nil, driverResult.status == "Finished" {
                Text(driverResult.time!.time)
            } else if driverResult.status.contains("+") {
                Text(driverResult.status)
            } else {
                Text("DNF (" + driverResult.status + ")")
            }
          
        }.font(Font.f1FontRegular(size: 16)).padding(10)
          .overlay(
            Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(
              Color(
                hex: TeamColorCodes.getColorCode(for: driverResult.constructor.constructorId)
                  ?? "000000")), alignment: .leading)
      }
    }.padding([.leading], 7)

  }
}
