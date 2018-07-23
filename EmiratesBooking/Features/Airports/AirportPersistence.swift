//
//  AirportPersistence.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 23/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import Foundation

fileprivate var runtimeAirports: [Airport]? = nil
fileprivate var runtimeNearestAirports: [String]? = nil

class AirportPersistence {
    var airports: [Airport]? {
        get { return runtimeAirports }
        set(newValue) { runtimeAirports = newValue }
    }
    var nearestAirports: [String]? {
        get { return runtimeNearestAirports }
        set(newValue) { runtimeNearestAirports = newValue }
    }
}
