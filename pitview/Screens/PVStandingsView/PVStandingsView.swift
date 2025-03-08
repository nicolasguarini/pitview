//
//  PVSeasonsView.swift
//  PitView
//
//  Created by Nicolas Guarini on 24/02/24.
//

import SwiftUI

struct PVStandingsView: View {
    @StateObject var viewModel = PVStandingsViewModel()
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    PVAppHeader()
                    
                    Picker(selection: $selectedIndex, label: Text("")) {
                        Text("Drivers").tag(0)
                        Text("Constructors").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 280)
                    .padding()
                    
                    if selectedIndex == 0 {
                        ScrollView {
                            VStack {
                                if (viewModel.driverStandings.count > 0){
                                    ForEach(viewModel.driverStandings, id: \.driver.code) { driverStanding in
                                        PVSimpleListItemView(left: driverStanding.position,
                                                             main: driverStanding.driver.givenName + " " + driverStanding.driver.familyName,
                                                             right: driverStanding.points + " pt."
                                        ).padding().onTapGesture {
                                            viewModel.selectedDriver = driverStanding.driver
                                            viewModel.selectedConstructor = driverStanding.constructors[0]
                                            viewModel.isShowingDriverDetails = true
                                        }
                                    }
                                } else {
                                    Text("No standings yet! Wait the start of the season :)")
                                }
                                
                            }
                        }
                    } else {
                        ScrollView {
                            VStack {
                                if (viewModel.constructorStandings.count > 0){
                                    ForEach(viewModel.constructorStandings, id: \.constructor.constructorId) { constructorStanding in
                                        PVSimpleListItemView(left: constructorStanding.position,
                                                             main: constructorStanding.constructor.name,
                                                             right: constructorStanding.points + " pt."
                                        ).padding()
                                    }
                                }else{
                                    Text("No standings yet! Wait the start of the season :)")
                                }
                            }
                        }
                    }
                }.padding(8).task {
                    viewModel.getStandings()
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

#Preview {
    PVStandingsView()
}
