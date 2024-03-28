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
                    HStack{
                        Image(race.circuit.circuitId)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                        
                        VStack {
                            Text(race.circuit.circuitName)
                                .font(.f1FontWide(size: 15))
                                .padding()
                            
                            if let countryCode = CountryCodes.countryCode(for: race.circuit.location.country.lowercased()) {
                                FlagView(countryCode: countryCode).frame(width: 22, height: 22)
                            } else {
                                Text(race.circuit.location.country).font(.f1FontBold(size: 18))
                            }
                            
                        }
                    }

                    HStack(spacing: 25) {
                        if let qualifying = race.qualifying {
                            VStack(spacing: 7) {
                                Text("Qualifying").font(.f1FontBold(size: 18)).padding(1)
                                
                                HStack {
                                    Text(qualifying.date).font(.f1FontRegular(size: 16))
                                    Text(TimeUtils.convertTime(qualifying.time) ?? qualifying.time).font(.f1FontRegular(size: 16))
                                }
                                
                            }
                        }
                        
                        if let time = race.time, let date = race.date {
                            VStack(spacing: 7){
                                Text("Race").font(.f1FontBold(size: 18)).padding(1)
                                
                                HStack {
                                    Text(date).font(.f1FontRegular(size: 16))
                                    Text(TimeUtils.convertTime(time) ?? time).font(.f1FontRegular(size: 16))
                                }
                            }
                        }
                    }.padding([.bottom], 20)
                    
                    ZStack {
                        VStack {
                            VStack {
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
