//
//  CredentialsProvider.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 23/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import Alamofire

struct CredentialsProvider {
    let headers: HTTPHeaders = [
        "Authorization": "IwFLQhwPuVJV6Pzg6yOo5D11waNszXcgZdou6htSkhPV",
        "apptype": "android",
        "X-Api-Version": "4.5.0",
        "DTKN": "ActFvHgz2KildXz"
    ]
}
