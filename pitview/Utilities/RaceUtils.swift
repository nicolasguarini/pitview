//
//  RaceUtils.swift
//  PitView
//
//  Created by Nicolas Guarini on 29/03/24.
//

import Foundation

class RaceUtils {
    static func calculateAverageSpeed(driverResults: [DriverResult]) -> Int? {
        let fastestLaps = driverResults.compactMap { $0.fastestLap }
        
        guard !fastestLaps.isEmpty else {
            return nil
        }
        
        let sumOfSpeeds = fastestLaps.compactMap { $0.averageSpeed?.speed }.reduce(0.0) { (result, speedString) -> Double in
            guard let speed = Double(speedString) else {
                return result
            }
            return result + speed
        }
        
        let averageSpeed = sumOfSpeeds / Double(fastestLaps.count)
        
        return Int(round(averageSpeed))
    }
    
    static func calculateMaxLaps(driverResults: [DriverResult]) -> Int? {
        guard !driverResults.isEmpty else {
            return nil
        }
        
        let maxLaps = driverResults.compactMap { Int($0.laps) }.max()
        
        return maxLaps
    }
}
