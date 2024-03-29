//
//  Result.swift
//  PitView
//
//  Created by Nicolas Guarini on 28/03/24.
//

import Foundation

struct DriverResult: Codable {
    let position: String
    let points: String
    let driver: Driver
    let constructor: Constructor
    let grid: String
    let laps: String
    let status: String
    let time: Time?
    let fastestLap: FastestLap?
    
    private enum CodingKeys: String, CodingKey {
        case position
        case points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid
        case laps
        case status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

struct Time: Codable {
    let millis: String?
    let time: String
}

struct FastestLap: Codable {
    let rank: String
    let lap: String
    let time: Time?
    let averageSpeed: AverageSpeed?
    
    private enum CodingKeys: String, CodingKey {
        case rank
        case lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

struct AverageSpeed: Codable {
    let units: String
    let speed: String
}
