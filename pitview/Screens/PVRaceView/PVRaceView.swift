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
                                    ForEach(viewModel.results, id: \.driver.driverId) { driverResult in
                                        HStack {
                                            Text(driverResult.position)
                                            
                                            Text(driverResult.driver.givenName + " " + driverResult.driver.familyName)
                                                .font(.f1FontBold(size: 16))
                                            
                                            Spacer()
                                            
                                            Text(driverResult.time?.time ?? "")
                                        }.font(Font.f1FontRegular(size: 16))
                                            .padding(10)
                                            .foregroundColor(.primary)
                                    }
                                } else {
                                    HStack(spacing: 15) {
                                        
                                        if race.firstPractice != nil {
                                            VStack {
                                                Text("FP1")
                                                    .font(.f1FontBold(size: 18))
                                                    .padding(1)
                                                
                                                Text(race.firstPractice?.date ?? "").font(.f1FontRegular(size: 16))
                                                Text(TimeUtils.convertTime(race.firstPractice?.time ?? "") ?? "").font(.f1FontRegular(size: 16))
                                            }
                                        }
                                        
                                        if race.secondPractice != nil {
                                            VStack {
                                                Text("FP2")
                                                    .font(.f1FontBold(size: 18))
                                                    .padding(1)
                                                
                                                Text(race.secondPractice?.date ?? "").font(.f1FontRegular(size: 16))

                                                Text(TimeUtils.convertTime(race.secondPractice?.time ?? "") ?? "").font(.f1FontRegular(size: 16))

                                            }
                                        }
                                        
                                        if race.thirdPractice != nil {
                                            VStack {
                                                Text("FP3")
                                                    .font(.f1FontBold(size: 18))
                                                    .padding(1)
                                                
                                                Text(race.thirdPractice?.date ?? "").font(.f1FontRegular(size: 16))
                                                Text(TimeUtils.convertTime(race.thirdPractice?.time ?? "") ?? "").font(.f1FontRegular(size: 16))
                                            }
                                        }
                                        
                                        if race.sprint != nil {
                                            VStack {
                                                Text("Sprint")
                                                    .font(.f1FontBold(size: 18))
                                                    .padding(1)
                                                
                                                Text(race.sprint?.date ?? "").font(.f1FontRegular(size: 16))
                                                Text(TimeUtils.convertTime(race.sprint?.time ?? "") ?? "").font(.f1FontRegular(size: 16))
                                            }
                                        }
                                    }
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
