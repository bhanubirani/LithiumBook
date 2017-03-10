//
//  LBBookListInteractor.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

protocol BookListInteractorProtocol {
    func didRecieveBookList(books: [LBBookObject])
}

private let _sharedInstance = LBBookListInteractor()

public class LBBookListInteractor {
    
    fileprivate init(){}
    
    static var sharedInstance: LBBookListInteractor {
        return _sharedInstance
    }
    
    var delegate: BookListInteractorProtocol?
    
    fileprivate let networkWrapper = NetworkWrapper.sharedInstance
    fileprivate var booksArray = [LBBookObject]()
    
    public func fetchBooks() {
        networkWrapper.getFeeds(onSuccess: { (array) in
            
            let _json = JSON(array)
            let _books = _json.arrayObject
            
            for lbook in _books! {
                guard let _tmpBooks = Mapper<LBBookObject>().map(JSONObject: lbook) else {
                    continue;
                }
                print(_tmpBooks.name ?? "ERROR")
                self.booksArray.append(_tmpBooks)
            }
            
            self.delegate?.didRecieveBookList(books: self.booksArray)
            
        }, onFailure: { (error) in
            print("get feeds")
        })
    }
    
}
