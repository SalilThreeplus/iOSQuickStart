//
//  NetworkingConstants.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import Foundation

struct NetworkingConstants {
    struct BaseUrlServer {
        //TODO:- Put base url here
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
    enum ContentType: String {
        case json = "application/json"
    }
    enum HTTPHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
}
