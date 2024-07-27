//
//  PVDriversView.swift
//  PitView
//
//  Created by Nicolas Guarini on 24/02/24.
//

import SwiftUI

struct PVScheduleView: View {
    @StateObject var viewModel = PVScheduleViewModel()
    @State private var selectedIndex = 0
    let currentYear = Calendar.current.component(.year, from: Date())

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    PVAppHeader()
                    
                    PVSeasonProgressView(season: UserDefaults.standard.string(forKey: "selectedSeason") ?? "\(currentYear)", races: viewModel.season.races)
                    
                    Picker(selection: $selectedIndex, label: Text("")) {
                        Text("Future Races").tag(0)
                        Text("Past Races").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 280)
                    .padding()
                    
                    if viewModel.season.races.count > 1 {
                        let nextRaceRound = (Int(viewModel.latestRace?.round ?? "0") ?? 0)
                        
                        if selectedIndex == 0 {
                            ScrollView {
                                VStack(spacing: 25) {
                                    if (nextRaceRound < viewModel.season.races.count) {
                                        VStack(alignment: .leading, spacing: 15) {
                                            Text("Next race").font(.f1FontRegular(size: 16))
                                            PVNextRaceView(race: viewModel.season.races[nextRaceRound])
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 15) {
                                            Text("Future races").font(.f1FontRegular(size: 16))
                                            ForEach(viewModel.season.races[(nextRaceRound+1)...], id: \.raceName) { race in
                                                PVNextRaceView(race: race)
                                            }
                                        }
                                    } else {
                                        Text("The season is finished! No upcoming races.")
                                    }
                                }
                            }
                        } else {
                            ScrollView {
                                VStack(spacing: 15) {
                                    ForEach(viewModel.season.races[...(nextRaceRound-1)].reversed(), id: \.raceName) { race in
                                        PVRaceCardView(race: race)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }.padding(8).task {
                    viewModel.getSeason()
                }
                
                
                if viewModel.isLoading {
                    PVLoadingView()
                }
            }.alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismssButton)
            }
        }
    }
}

#Preview {
    PVScheduleView()
}
