//
//  DriverDetailsView.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/02/24.
//

import SwiftUI

struct DriverDetailsView: View {
    @Binding var isPresented: Bool
    let driver: Driver
    
    var body: some View {
        VStack {
            HStack {
                Text("Driver Details")
                    .font(.title).bold().font(.headline)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    isPresented = false
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                })
            }.padding(.horizontal)
            
            
            Text("Name: \(driver.givenName) \(driver.familyName)")
                .padding()
            
            Text("Number: \(driver.permanentNumber)").padding()
            
            Text("Date of birth: \(driver.dateOfBirth)").padding()
            
            Text("Nationality: \(driver.nationality)").padding()
            
            Spacer()
        }
    }
}
