//
//  LoadingView.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import SwiftUI

struct PVLoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
        }
    }
}

#Preview {
    PVLoadingView()
}
