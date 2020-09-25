//
//  ApiRouter.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import Foundation
import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case posts
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .posts:
            return .get
        
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .posts:
            return "/todos/1"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .posts:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkingConstants.BaseUrlServer.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(NetworkingConstants.ContentType.json.rawValue, forHTTPHeaderField: NetworkingConstants.HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(NetworkingConstants.ContentType.json.rawValue, forHTTPHeaderField: NetworkingConstants.HTTPHeaderField.contentType.rawValue)
        
        //TODO:- Get token here
//        if let token = UserDefaults.standard.value(forKey: ConstantUserDefaultKeys.token.rawValue) {
//            urlRequest.setValue("\(token)", forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
//        }
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

