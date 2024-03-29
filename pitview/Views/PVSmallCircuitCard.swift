//
//  PVSmallCircuitCard.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/03/24.
//

import SwiftUI
import FlagsKit

struct PVSmallCircuitCard: View {
    let circuit: Circuit
    
    var body: some View {
        HStack{
            Image(circuit.circuitId)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            
            VStack {
                Text(circuit.circuitName)
                    .font(.f1FontWide(size: 15))
                    .padding()
                
                if let countryCode = CountryCodes.countryCode(for: circuit.location.country.lowercased()) {
                    FlagView(countryCode: countryCode).frame(width: 22, height: 22)
                } else {
                    Text(circuit.location.country).font(.f1FontBold(size: 18))
                }
                
            }
        }
    }
}

#Preview {
    PVSmallCircuitCard(circuit: MockData.mockCircuit)
}
