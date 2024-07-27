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
                                    PVBasicRaceStatsView(results: viewModel.results)
                                        .padding([.bottom], 20)
                                    PVRaceResultsListView(results: viewModel.results)
                                } else {
                                    VStack(spacing: 15) {
                                        if let fp1 = race.firstPractice {
                                            PVSessionTimeView(
                                                sessionName: "Free Practice 1",
                                                compact: false,
                                                date: fp1.date,
                                                time: fp1.time
                                            )
                                        }
                                        
                                        if let fp2 = race.secondPractice {
                                            PVSessionTimeView(
                                                sessionName: "Free Practice 2",
                                                compact: false,
                                                date: fp2.date,
                                                time: fp2.time
                                            )
                                        }
                                        
                                        if let fp3 = race.thirdPractice {
                                            PVSessionTimeView(
                                                sessionName: "Free Practice 3",
                                                compact: false,
                                                date: fp3.date,
                                                time: fp3.time
                                            )
                                        }
                                        
                                        if let sprint = race.sprint {
                                            PVSessionTimeView(
                                                sessionName: "Sprint Race",
                                                compact: false,
                                                date: sprint.date,
                                                time: sprint.time
                                            )
                                        }
                                        
                                        if let qualifying = race.qualifying {
                                            PVSessionTimeView(
                                                sessionName: "Qualifying",
                                                compact: false,
                                                date: DateUtils.formatDate(qualifying.date),
                                                time: qualifying.time
                                            )
                                        }
                                        
                                        if let date = race.date, let time = race.time {
                                            PVSessionTimeView(sessionName: "Race", compact: false, date: DateUtils.formatDate(date), time: time)
                                        }
                                        
                                    }
                                }
                            }
                        }.task {
                            viewModel.getResults(season: race.season, round: race.round)
                        }
                        
                        if viewModel.isLoading {
                            PVLoadingView()
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
