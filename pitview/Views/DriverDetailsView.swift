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
                Spacer()
                
                Text("Driver Details")
                    .font(.f1FontBold(size: 20)).padding()
                
                Spacer()
                
                Button(action: {
                    isPresented = false
                }, label: {
                    Image(systemName: "xmark.circle")
                })
            }.padding(.horizontal)
            
            
            HStack {
                VStack {
                    Image(driver.driverId)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 280)
                
                VStack {
                    Text(" \(driver.givenName) \(driver.familyName)")
                        .font(.f1FontRegular(size: 18))
                        .padding().lineSpacing(10).multilineTextAlignment(.center)
                    
                    Text("AGE: \(calculateAge(dateString: driver.dateOfBirth) ?? 0)")
                        .font(.f1FontRegular(size: 14))
                    
                    Image("ferrari")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
                        .padding()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Season Data")
                    }).buttonStyle(.bordered).tint(.warmWhite)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical)

            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical)

        }
        
        VStack(alignment: .leading, spacing: 25) {
            if driver.code != nil {
                Text("Code: \(driver.code!)")
            }
            
            Text("Number: \(driver.permanentNumber)")
            
            Text("Date of birth: \(driver.dateOfBirth)")
            
            Text("Nationality: \(driver.nationality)").frame(maxWidth: .infinity, alignment: .leading)
            
        }.frame(minWidth: 0, maxWidth: .infinity).padding().font(.f1FontRegular(size: 14))
        
        Spacer()
    }
    
    func calculateAge(dateString: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let dateOfBirth = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
            return ageComponents.year
        } else {
            return nil
        }
    }
}
