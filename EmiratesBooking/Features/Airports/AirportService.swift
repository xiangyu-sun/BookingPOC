//
//  AirportService.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 23/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import Foundation
import Alamofire

class AirportService {
    
    let credentials = CredentialsProvider()
    let urls = UrlRepository()
    
    func fetchAirports(_ language: String, didFetchAirports: @escaping ([Airport]) -> Void)  {
        Alamofire.request(urls.fetchAirports, method: .get, headers: credentials.headers)
            .responseJSON { response in
                guard let data = response.data else { return }
                do {
                    let allAirports = try JSONDecoder().decode([Airport].self, from: data)
                    didFetchAirports(allAirports)
                } catch let jsonError {
                    print(jsonError)
                }
            }
    }
    
    func fetchNearestAirports(latitude: Double, longitude: Double, didFetchNearestAirports: @escaping ([String]) -> Void ) {
        Alamofire.request(urls.fetchNearestAirports, method: .get, parameters: ["latitude": latitude, "longitude": longitude], encoding: URLEncoding(destination: .queryString), headers: credentials.headers)
            .responseJSON { response in
                guard let data = response.data else { return }
                do {
                    let nearestAirports = try JSONDecoder().decode([String].self, from: data)
                    didFetchNearestAirports(nearestAirports)
                } catch let jsonError {
                    print(jsonError)
                }
            }
    }
}
