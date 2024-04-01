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

          Spacer()

          Text(driverResult.time?.time ?? "")
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
