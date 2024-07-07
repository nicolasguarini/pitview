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
    
    static func getRaceDateTime(race: Race) -> Date? {
        let dateTimeString = "\(race.date ?? "")T\(race.time ?? "")"
        let dateFormatter = ISO8601DateFormatter()
        
        return dateFormatter.date(from: dateTimeString)
    }
    
    static func isRaceCompleted(_ race: Race) -> Bool {
        if race.date == nil || race.time == nil {
            return false
        }
        
        guard let raceDate = getRaceDateTime(race: race) else { return false }
        return raceDate < Date()
    }
    
    static func getLastCompletedRace(from races: [Race]) -> Race? {
        let completedRaces = races.filter { RaceUtils.isRaceCompleted($0) }
        return completedRaces.max { RaceUtils.getRaceDateTime(race: $0)! < RaceUtils.getRaceDateTime(race: $1)! }
    }
}
