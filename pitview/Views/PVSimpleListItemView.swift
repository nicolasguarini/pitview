//
//  PVSimpleListItem.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/03/24.
//

import SwiftUI

struct PVSimpleListItemView: View {
    let left: String
    let main: String
    let right: String
    
    var body: some View {
        HStack {
            Text(left)
            
            Text(main).font(.f1FontBold(size: 16))
            
            Spacer()
            
            Text(right)
        }.font(Font.f1FontRegular(size: 16))
    }
}
