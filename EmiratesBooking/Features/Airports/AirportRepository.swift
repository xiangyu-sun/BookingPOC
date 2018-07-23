//
//  AirportRepository.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 23/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import Foundation

class AirportRepository {
    
    let persistence = AirportPersistence()
    let service = AirportService()
    let languageProvider = LanguageProvider()
    
    func refreshNearestAirport(latitude: Double, longitude: Double, didRefreshNearestAirport: @escaping (Airport) -> Void, didRefreshAllAirports: @escaping ([Airport]) -> Void) {
        guard let airports = persistence.airports else {
            service.fetchAirports(languageProvider.deviceCode) { airports in
                self.persistence.airports = airports
                didRefreshAllAirports(airports)
                self.refreshNearestAirport(latitude: latitude, longitude: longitude, didRefreshNearestAirport: didRefreshNearestAirport, didRefreshAllAirports: didRefreshAllAirports)
            }
            return
        }
        guard let nearestAirports = persistence.nearestAirports else {
            service.fetchNearestAirports(latitude: latitude, longitude: longitude) { nearestAirports in
                self.persistence.nearestAirports = nearestAirports
                self.refreshNearestAirport(latitude: latitude, longitude: longitude, didRefreshNearestAirport: didRefreshNearestAirport, didRefreshAllAirports: didRefreshAllAirports)
            }
            return
        }
        let nearest = nearestAirports.map { code in airports.first(where: { airport in  airport.code == code }) }.compactMap { $0 }
        if nearest.count > 0 {
            didRefreshNearestAirport(nearest[0])
        }
    }
}
