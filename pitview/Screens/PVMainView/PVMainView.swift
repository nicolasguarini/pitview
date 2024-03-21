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
                    Text("PitView").font(.f1FontBold(size: 24)).bold().padding()
                    
                    VStack {
                        Text("Drivers").font(.f1FontItalic(size: 22))
                        
                        
                        ForEach(viewModel.driverStandings.first(5), id: \.driver.code) { driverStanding in
                                Button(action: {
                                    viewModel.selectedDriver = driverStanding.driver
                                    viewModel.selectedConstructor = driverStanding.constructors[0]
                                    viewModel.isShowingDriverDetails = true
                                }) {
                                    HStack {
                                        Text(driverStanding.position)
                                        
                                        Text(driverStanding.driver.givenName + " " + driverStanding.driver.familyName).font(Font.f1FontBold(size: 16))
                                        
                                        Spacer()
                                        
                                        Text(driverStanding.points + " pt")
                                    }.font(Font.f1FontRegular(size: 16))
                                        .padding()
                                        .foregroundColor(.primary)
                                    
                                    
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
