//
//  PVSessionTimeView.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/03/24.
//

import SwiftUI

struct PVSessionTimeView: View {
    let sessionName: String
    let compact: Bool
    let date: String
    let time: String?
    
    var body: some View {
        if compact {
            VStack(spacing: 10) {
                Text(sessionName).font(.f1FontBold(size: 18)).padding(1)
                
                HStack {
                    Text(date).font(.f1FontRegular(size: 16))
                    
                    if let time = time  {
                        Text(TimeUtils.convertTime(time) ?? time).font(.f1FontRegular(size: 16))
                    }
                }
                
            }
        } else {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text(sessionName).font(.f1FontBold(size: 18)).padding(1)
                    
                    HStack(spacing: 10) {
                        Text(DateUtils.formatDate(date)).font(.f1FontRegular(size: 16))
                        
                        if let time = time  {
                            Text(TimeUtils.convertTime(time) ?? time).font(.f1FontRegular(size: 16))
                        }
                    }
                }
                
                Spacer()
                
                Image(systemName: "bell").tint(.hotRed).onTapGesture {
                    print("bell pressed")
                }
            }
            .padding([.all], 20).frame(maxWidth: .infinity, alignment: .leading).background(.secondarySystemBackground)
            
        }
    }
}

