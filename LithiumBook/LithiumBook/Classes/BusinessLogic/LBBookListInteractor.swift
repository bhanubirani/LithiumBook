//
//  LBBookListInteractor.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit

private let _sharedInstance = LBBookListInteractor()

public class LBBookListInteractor {
    
    fileprivate init(){}
    
    static var sharedInstance: LBBookListInteractor {
        return _sharedInstance
    }
    
    
}
