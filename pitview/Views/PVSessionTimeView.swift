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
        VStack(spacing: 7) {
            Text(sessionName).font(.f1FontBold(size: 18)).padding(1)
            
            if compact {
                VStack {
                    Text(date).font(.f1FontRegular(size: 16))
                    
                    if let time = time  {
                        Text(TimeUtils.convertTime(time) ?? time).font(.f1FontRegular(size: 16))
                    }
                }
            } else {
                HStack(spacing: 10) {
                    Text(date).font(.f1FontRegular(size: 16))
                    
                    if let time = time  {
                        Text(TimeUtils.convertTime(time) ?? time).font(.f1FontRegular(size: 16))
                    }
                }
            }
        }
    }
}

