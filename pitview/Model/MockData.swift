//
//  MockData.swift
//  PitView
//
//  Created by Nicolas Guarini on 03/03/24.
//

import Foundation

struct MockData {
    static let mockLocation = Location(lat: "26.0325", long: "50.5106", locality: "Sakhir", country: "Bahrain")
    static let mockCircuit = Circuit(circuitId: "bahrain", circuitName: "Bahrain International Circuit", location: mockLocation)
    static let mockDriver = Driver(driverId: "leclerc", permanentNumber: "16", code: "LEC", givenName: "Charles", familyName: "Leclerc", dateOfBirth: "1997-10-15", nationality: "Monegasque")
    static let mockConstructor = Constructor(constructorId: "ferrari", name: "Ferrari", nationality: "Italian")
    static let mockRace = Race(
        raceName: "Bahrain Grand Prix",
        round: "1", season: "2024",
        date: "2024-03-02", time: "15:00:00Z", 
        circuit: mockCircuit,
        firstPractice: FirstPractice(date: "2024-03-01", time: "13:00:00Z"),
        secondPractice: SecondPractice(date: "2024-03-01", time: "16:00:00Z"),
        thirdPractice: ThirdPractice(date: "2024-03-02", time: "11:00:00Z"),
        qualifying: Qualifying(date: "2024-03-02", time: "13:00:00Z"), sprint: Sprint(date: "2024-03-02", time: "12:00:00Z"), results: nil)
    static let mockSeason = Season(season: "2024", races: [mockRace])
    static let mockDriverStanding = DriverStanding(position: "1", points: "26", driver: mockDriver, constructors: [mockConstructor])
    static let mockConstructorStanding = ConstructorStanding(position: "1", points: "10", wins: "1", constructor: mockConstructor)
    static let mockTime = Time(millis: "23423423", time: "1:18:203")
    static let mockFastestLap = FastestLap(rank: "1", lap: "56", time: mockTime)
    static let mockDriverResult = DriverResult(position: "1", points: "25", driver: mockDriver, constructor: mockConstructor, grid: "4", laps: "58", status: "Finished", time: mockTime, fastestLap: mockFastestLap)
}
