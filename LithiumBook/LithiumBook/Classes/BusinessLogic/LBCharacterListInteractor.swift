//
//  LBCharacterListInteractor.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit

private let _sharedInstance = LBCharacterListInteractor()

public class LBCharacterListInteractor {
    
    fileprivate init(){}
    
    static var sharedInstance: LBCharacterListInteractor {
        return _sharedInstance
    }
}
