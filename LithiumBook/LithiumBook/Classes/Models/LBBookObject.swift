//
//  LBBookObject.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit
import ObjectMapper

class LBBookObject: Mappable {
    
    var name: String?
    var characters: [String]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        characters <- map["characters"]
    }
}
