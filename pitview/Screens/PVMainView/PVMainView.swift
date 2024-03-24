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
                    HStack(spacing: 1) {
                        Text("Pit").font(.f1FontBold(size: 26))
                        Text("View").font(.f1FontRegular(size: 26))
                    }.padding()
                    
                    Picker(selection: $selectedIndex, label: Text("")) {
                        Text("Drivers").tag(0)
                        Text("Constructors").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 280)
                    .padding()
                    
                    // Show different views based on selected index
                    if selectedIndex == 0 {
                        VStack {
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
                        }
                    } else {
                        VStack {
                            ForEach(viewModel.constructorStandings.first(5), id: \.constructor.constructorId) { constructorStanding in
                                HStack {
                                    Text(constructorStanding.position)
                                    
                                    Text(constructorStanding.constructor.name).font(.f1FontBold(size: 16))
                                    
                                    Spacer()
                                    
                                    Text(constructorStanding.points + " pt")
                                }.font(Font.f1FontRegular(size: 16))
                                    .padding()
                                    .foregroundColor(.primary)
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
