//
//  Driver.swift
//  PitView
//
//  Created by Nicolas Guarini on 28/02/24.
//

import Foundation

struct Driver: Codable {
    let driverId: String
    let permanentNumber: String
    let code: String?
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String
}

struct DriverStanding: Codable {
    let position: String
    let points: String
    let driver: Driver
    let constructors: [Constructor]
    let status: String?
    let grid: String?
    
    private enum CodingKeys: String, CodingKey {
        case position
        case points
        case driver = "Driver"
        case constructors = "Constructors"
        case status
        case grid
    }
}
