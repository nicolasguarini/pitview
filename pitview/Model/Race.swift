//
//  Race.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

struct Race: Codable {
    let raceName: String
    let round: String
    let season: String
    let date: String?
    let time: String?
    let circuit: Circuit
    let firstPractice: FirstPractice?
    let secondPractice: SecondPractice?
    let thirdPractice: ThirdPractice?
    let qualifying: Qualifying?
    let results: [DriverResult]?
    
    private enum CodingKeys: String, CodingKey {
        case raceName
        case round
        case season
        case date
        case time
        case circuit = "Circuit"
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
        case results = "Results"
    }
}

struct FirstPractice: Codable {
    let date: String
    let time: String
}

struct SecondPractice: Codable {
    let date: String
    let time: String
}

struct ThirdPractice: Codable {
    let date: String
    let time: String
}

struct Qualifying: Codable {
    let date: String
    let time: String
}
