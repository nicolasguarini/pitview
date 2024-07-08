//
//  PVMainView.swift
//  PitView
//
//  Created by Nicolas Guarini on 24/02/24.
//

import SwiftUI

struct PVMainView: View {
    @StateObject var viewModel = PVMainViewModel()
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    PVAppHeader()
                    
                    PVSeasonProgressView(season: "2024", races: viewModel.season.races)
                    
                    if viewModel.latestRace != nil {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Latest Race").font(.f1FontRegular(size: 16))
                            PVLatestRaceView(race: viewModel.latestRace!, raceResults: viewModel.latestRaceResults)
                        }
                    }
                    
                    Picker(selection: $selectedIndex, label: Text("")) {
                        Text("Drivers").tag(0)
                        Text("Constructors").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 280)
                    .padding()
                    
                    if selectedIndex == 0 {
                        VStack {
                            ForEach(viewModel.driverStandings.first(5), id: \.driver.code) { driverStanding in
                                    Button(action: {
                                        viewModel.selectedDriver = driverStanding.driver
                                        viewModel.selectedConstructor = driverStanding.constructors[0]
                                        viewModel.isShowingDriverDetails = true
                                    }) {
                                        PVSimpleListItemView(left: driverStanding.position,
                                                             main: driverStanding.driver.givenName + " " + driverStanding.driver.familyName,
                                                             right: driverStanding.points + " pt."
                                        ).padding()
                                    }.foregroundColor(.primary)
                            }
                        }
                    } else {
                        VStack {
                            ForEach(viewModel.constructorStandings.first(5), id: \.constructor.constructorId) { constructorStanding in
                                PVSimpleListItemView(left: constructorStanding.position,
                                                     main: constructorStanding.constructor.name,
                                                     right: constructorStanding.points + " pt."
                                ).padding()
                            }
                        }
                    }
                    
                    
                    VStack {
                        Spacer()
                        
                        List {
                            ForEach(viewModel.season.races, id: \.raceName) { race in
                                NavigationLink(destination: PVRaceView(race: race), label: {
                                    Text(race.raceName)
                                })
                            }
                        }
                    }
                }.padding(8).task {
                    viewModel.getSeason()
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
        }.alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismssButton)
        }
        .sheet(isPresented: $viewModel.isShowingDriverDetails) {
            if let driver = viewModel.selectedDriver, 
                let constructor = viewModel.selectedConstructor {
                DriverDetailsView(
                    isPresented: $viewModel.isShowingDriverDetails,
                    driver: driver,
                    constructor: constructor
                )
            }
        }
    }
}

#Preview {
    PVMainView()
}
