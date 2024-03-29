//
//  PVRaceView.swift
//  PitView
//
//  Created by Nicolas Guarini on 03/03/24.
//

import SwiftUI
import FlagsKit
import SwiftUIX

struct PVRaceView: View {
    var race: Race
    @StateObject var viewModel = PVRaceViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    PVRaceHeader(race: race).padding([.bottom], 10)
                    
                    ZStack {
                        VStack {
                            VStack {
                                if !viewModel.results.isEmpty {
                                    HStack(spacing: 40) {
                                        if let laps = RaceUtils.calculateMaxLaps(driverResults: viewModel.results) {
                                            HStack {
                                                Text(String(laps)).font(.f1FontBold(size: 28))
                                                Text("LAPS").font(.f1FontRegular(size: 18))
                                            }
                                            
                                        }
                                        
                                        if let averageSpeed = RaceUtils.calculateAverageSpeed(driverResults: viewModel.results) {
                                            VStack(spacing: 7) {
                                                Text("Avg. Speed").font(.f1FontRegular(size: 16))
                                                Text(String(averageSpeed) + " kph").font(.f1FontBold(size: 24))
                                            }
                                        }
                                    }.padding([.bottom], 20)
                                    
                                    ForEach(viewModel.results, id: \.driver.driverId) { driverResult in
                                        PVSimpleListItemView(
                                            left: driverResult.position,
                                            main: driverResult.driver.givenName + " " + driverResult.driver.familyName,
                                            right: driverResult.time?.time ?? ""
                                        ).padding(10)
                                    }
                                } else {
                                    HStack(spacing: 15) {
                                        if let fp1 = race.firstPractice {
                                            PVSessionTimeView(
                                                sessionName: "FP1",
                                                compact: true,
                                                date: fp1.date,
                                                time: fp1.time
                                            )
                                        }
                                        
                                        if let fp2 = race.secondPractice {
                                            PVSessionTimeView(
                                                sessionName: "FP2",
                                                compact: true,
                                                date: fp2.date,
                                                time: fp2.time
                                            )
                                        }
                                        
                                        if let fp3 = race.thirdPractice {
                                            PVSessionTimeView(
                                                sessionName: "FP3",
                                                compact: true,
                                                date: fp3.date,
                                                time: fp3.time
                                            )
                                        }
                                        
                                        if let sprint = race.sprint {
                                            PVSessionTimeView(
                                                sessionName: "Sprint",
                                                compact: true,
                                                date: sprint.date,
                                                time: sprint.time
                                            )
                                        }
                                    }
                                    
                                    Button(action: {}, label: {
                                        HStack {
                                            Image(systemName: "bell")
                                            Text("Set Reminder")
                                        }
                                    }).buttonStyle(.bordered).padding([.all], 30)
                                }
                            }
                        }.task {
                            viewModel.getResults(season: race.season, round: race.round)
                        }
                        
                        if viewModel.isLoading {
                            LoadingView()
                        }
                    }
                    
                    
                    Spacer()
                }
            }
            
        }.navigationTitle(race.raceName)
            .padding([.top], 1)
    }
}

#Preview {
    PVRaceView(race: MockData.mockRace)
}
