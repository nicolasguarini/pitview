//
//  Circuit.swift
//  PitView
//
//  Created by Nicolas Guarini on 03/03/24.
//

import Foundation

struct Circuit: Codable {
    let circuitId: String
    let circuitName: String
    let location: Location
    
    private enum CodingKeys: String, CodingKey {
        case circuitId
        case circuitName
        case location = "Location"
    }
}
