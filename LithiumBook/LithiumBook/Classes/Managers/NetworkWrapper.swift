//
//  NetworkWrapper.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - NETWORK WRAPPER -

private let _sharedInstance = NetworkWrapper()
private let DEBUG_MODE = false

class NetworkWrapper {
    
    private let restClient = RestClient()
    
    fileprivate init(){}
    
    static var sharedInstance: NetworkWrapper {
        return _sharedInstance
    }
    
    /// get feeds
    ///
    /// - Parameters:
    ///   - onSuccess: success callback
    ///   - onFailure: failure callback
    func getFeeds(onSuccess:@escaping (NSDictionary)->(),
                  onFailure:(NSError)->()) {
        
        let _url: URLRequestConvertible = LBRequestRouter.Router.getBooks
        restClient.makeRequest(url: _url, onSuccess: onSuccess, onFailure: onFailure)
    }
}


// MARK: - REST CLIENT -

fileprivate class RestClient {
    
    public func makeRequest(url: URLRequestConvertible,
                            onSuccess: @escaping (NSDictionary) -> (),
                            onFailure: (NSError) -> ()
        ) -> Void {
        
        Alamofire.request(url)
            .validate()
            .responseJSON { response in
                
                if DEBUG_MODE {
                    print("--------START---------")
                    print(response) // print response
                    print(response.request ?? "")  // original URL request
                    print(response.response ?? "") // HTTP URL response
                    print(response.data ?? "")     // server data
                    print(response.result)   // result of response serialization
                }
                
                switch response.result {
                case .success:
                    if let result = response.result.value {
                        let JSON = result as! NSDictionary
                        onSuccess(JSON)
                    }
                    break
                case .failure:
                    print("failure \(response)")
                    break
                }
                
        }
    }
    
}