//
//  PVMainView.swift
//  PitView
//
//  Created by Nicolas Guarini on 24/02/24.
//

import SwiftUI

struct PVMainView: View {
    @StateObject var viewModel = PVMainViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text(viewModel.season.season + " World Championship").font(.title).bold().padding()
                    
                    VStack {
                        List {
                            ForEach(viewModel.driverStandings, id: \.driver.code) { driverStanding in
                                Button(action: {
                                    viewModel.selectedDriver = driverStanding.driver
                                    viewModel.isShowingDriverDetails = true
                                }) {
                                    Text(driverStanding.driver.givenName + " " + driverStanding.driver.familyName)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        List {
                            ForEach(viewModel.season.races, id: \.raceName) { race in
                                NavigationLink(destination: PVRaceView(race: race), label: {
                                    Text(race.raceName)
                                })
                            }
                        }
                    }
                }.task {
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
            if let driver = viewModel.selectedDriver {
                DriverDetailsView(
                    isPresented: $viewModel.isShowingDriverDetails,
                    driver: driver
                )
            }
        }
    }
}

#Preview {
    PVMainView()
}
