//
//  Constructor.swift
//  PitView
//
//  Created by Nicolas Guarini on 28/02/24.
//

import Foundation

struct Constructor: Codable {
    let constructorId: String
    let name: String
    let nationality: String
}

struct ConstructorStanding: Codable {
    let position: String
    let points: String
    let wins: String
    let constructor: Constructor
    
    private enum CodingKeys: String, CodingKey {
        case position
        case points
        case wins
        case constructor = "Constructor"
    }
}
