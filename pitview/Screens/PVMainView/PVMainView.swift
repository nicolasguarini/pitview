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
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.season.raceNames, id: \.self) { raceName in
                        Text(raceName).padding()
                    }
                    
                }.navigationTitle(viewModel.season.season + " Season")
            }.task {
                viewModel.getSeason()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

#Preview {
    PVMainView()
}
