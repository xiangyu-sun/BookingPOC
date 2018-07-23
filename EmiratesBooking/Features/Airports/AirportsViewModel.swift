//
//  AirportsViewModel.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 23/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import Foundation

enum ErrorType {
    
}

class AirportsViewModel {
    
    var didErrorOccur: ((ErrorType) -> Void)?
    var didProgressChange: ((Bool) -> Void)?
    var didAirportsChange: (([Airport]) -> Void)?
    var didNearestAirportChange: ((Airport) -> Void)?
    
    let repository = AirportRepository()
    
    func refreshNearestAirports(latitude: Double, longitude: Double) {
        didProgressChange?(true)
        let didRefreshNearestAirport: (Airport) -> Void = { airport in
            self.didProgressChange?(false)
            self.didNearestAirportChange?(airport)
        }
        let didRefreshAllAirports: ([Airport]) -> Void = { airports in
            self.didAirportsChange?(airports)
        }
        repository.refreshNearestAirport(latitude: latitude, longitude: longitude, didRefreshNearestAirport: didRefreshNearestAirport, didRefreshAllAirports: didRefreshAllAirports)
    }
    
}
