//
//  MRData.swift
//  PitView
//
//  Created by Nicolas Guarini on 27/02/24.
//

import Foundation

struct MRData: Decodable {
    let RaceTable: RaceTable
}

struct ErgastResponse: Decodable {
    let MRData: MRData
}
