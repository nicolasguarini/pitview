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
                ScrollView {
                    VStack {
                        PVAppHeader()
                        
                        PVSeasonProgressView(season: viewModel.season.season, races: viewModel.season.races)
                        
                        if viewModel.latestRace != nil {
                            VStack(spacing: 25) {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Latest Race").font(.f1FontRegular(size: 16))
                                    PVLatestRaceView(race: viewModel.latestRace!, raceResults: viewModel.latestRaceResults)
                                }
                                
                                if Int(viewModel.latestRace!.round) ?? 1000 < viewModel.season.races.count {
                                    let nextRace = viewModel.season.races[Int(viewModel.latestRace!.round)!]
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text("Next Race").font(.f1FontRegular(size: 16))
                                        PVNextRaceView(race: nextRace)
                                    }
                                }
                            }
                        }
                        
                        
                        VStack(alignment: .center) {
                            Text("Standings").font(.f1FontBold(size: 16)).padding()
                            
                            if (viewModel.driverStandings.count > 0) {
                                ForEach(viewModel.driverStandings.first(5), id: \.driver.driverId) { driverStanding in
                                    PVSimpleListItemView(left: driverStanding.position,
                                                         main: driverStanding.driver.givenName + " " + driverStanding.driver.familyName,
                                                         right: driverStanding.points + " pt."
                                    ).padding(10).onTapGesture(perform: {
                                        viewModel.selectedDriver = driverStanding.driver
                                        viewModel.selectedConstructor = driverStanding.constructors[0]
                                        viewModel.isShowingDriverDetails = true
                                    })
                                }
                            } else {
                                Text("No standings yet! Wait the start of the season :)")
                            }
                        }
                    
                    }.padding(8).task {
                        viewModel.getSeason()
                    }
                    
                    if viewModel.isLoading {
                        PVLoadingView()
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
                    PVDriverDetailsView(
                        isPresented: $viewModel.isShowingDriverDetails,
                        driver: driver,
                        constructor: constructor
                    )
                }
            }
        }
    }
}

#Preview {
    PVMainView()
}
