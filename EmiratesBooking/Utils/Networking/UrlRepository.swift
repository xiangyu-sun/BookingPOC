//
//  UrlRepository.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 23/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import Foundation

fileprivate let baseUrl = "http://localhost:8080"

struct UrlRepository {
    let fetchAirports = baseUrl + "/airport/list/v1"
    let fetchNearestAirports = baseUrl + "/airport/nearest/v1"
}
