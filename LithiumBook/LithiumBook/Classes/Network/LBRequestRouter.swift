//
//  LBRequestRouter.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit
import Alamofire

class LBRequestRouter {
    
    enum Router: URLRequestConvertible {
        
        case getBooks
        case getBookDetails(id: String)
        
        static let prodEnv = "http://anapioficeandfire.com/api"
        static let stagingEnv = "http://anapioficeandfire.com/api"
        static let baseURLString = stagingEnv
        
        var method: HTTPMethod {
            switch self {
            case .getBooks,
                 .getBookDetails: return .get
            }
        }
        
        var path: String {
            switch self {
            case .getBooks:
                return "/books"
            case .getBookDetails(let id):
                return "/characters/\(id)"
            }
        }
        
        // MARK: - URLRequestConvertible -
        
        func asURLRequest() throws -> URLRequest {
            let url = try Router.baseURLString.asURL()
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            
            switch self {
                
            case .getBooks:
                let params: Parameters = ["": ""]
                urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
                
            case .getBookDetails:
                let params: Parameters = ["": ""]
                urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
                
            }
            
            return urlRequest
        }
    }
}
