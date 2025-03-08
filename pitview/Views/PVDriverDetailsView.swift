//
//  DriverDetailsView.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/02/24.
//

import SwiftUI
import FlagsKit

struct PVDriverDetailsView: View {
    @Binding var isPresented: Bool
    let driver: Driver
    let constructor: Constructor
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                Text("\(driver.givenName) \(driver.familyName)")
                    .font(.f1FontBold(size: 20)).padding()
                
                Spacer()
                
                Image(systemName: "xmark.circle").onTapGesture {
                    isPresented = false
                }
            }
            
            VStack {
                HStack {
                    VStack {
                        Image(driver.driverId)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 280)
                    
                    VStack {
                        HStack(spacing: 18) {
                            Text(driver.code ?? "")
                                .font(.f1FontBold(size: 18))
                            
                            FlagView(countryCode: CountryCodes.getCountryCode(for: driver.nationality) ?? "").frame(width: 20, height: 20)
                            
                        }.padding()
                        
                        
                        if calculateAge(dateString: driver.dateOfBirth) != nil {
                            Text("\(calculateAge(dateString: driver.dateOfBirth) ?? 0) y/o")
                                .font(.f1FontRegular(size: 14))
                        }
                        
                        Image(constructor.constructorId)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 80)
                            .padding()
                        
                        /*
                        Button(action: {
                            
                        }, label: {
                            Text("Season Data")
                        }).buttonStyle(.bordered)
                         */
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical)

                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical)
                
                HStack(spacing: 17) {
                    VStack {
                        Text("Number").font(.f1FontBold(size: 14))
                        
                        Text(driver.permanentNumber).font(.f1FontBlack(size: 28))
                    }
                    
                    Divider().frame(height: 35)
                    
                    if driver.dateOfBirth != "" {
                        VStack(spacing: 10) {
                            Text("Birthday").font(.f1FontBold(size: 14))
                            
                            Text(driver.dateOfBirth).font(.f1FontBold(size: 20))
                        }
                        
                    }
                    
                    Divider().frame(height: 35)
                    
                    
                    VStack(spacing: 10) {
                        Text("Team").font(.f1FontBold(size: 14))
                        
                        FlagView(countryCode: CountryCodes.getCountryCode(for: constructor.nationality) ?? "").frame(width: 20, height: 20)
                    }
                    
                }.frame(minWidth: 0, maxWidth: .infinity).padding().font(.f1FontRegular(size: 14))
                
                Spacer()
            }.background(
                Rectangle()
                    .frame(width: 8)
                    .foregroundColor(Color(hex: TeamColorCodes.getColorCode(for: constructor.constructorId) ?? "E8002D"))
                    .offset(x: 5)
                , alignment: .leading
            )
        }.padding(.horizontal)
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

#Preview {
    PVDriverDetailsView(
        isPresented: .constant(true),
        driver: MockData.mockDriver,
        constructor: MockData.mockConstructor
    )
}
