//
//  PVAppHeader.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/03/24.
//

import SwiftUI

struct PVAppHeader: View {
    var body: some View {
        HStack(spacing: 1) {
            Text("Pit").font(.f1FontBold(size: 26))
            Text("View").font(.f1FontRegular(size: 26))
        }.padding()
    }
}

#Preview {
    PVAppHeader()
}
