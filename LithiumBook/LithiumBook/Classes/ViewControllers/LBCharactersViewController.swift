//
//  LBCharactersViewController.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

class LBCharactersViewController: UIViewController {

    @IBOutlet weak var scharsTV: UITableView!
    
    public var bookObject: LBBookObject!
    fileprivate var charNames = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(bookObject.name ?? "ERROR")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LBCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.bookObject.characters?.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let index = indexPath.row;
        cell?.tag = index;
        
        let charName = charNames["\(index)"];
        if (charName != nil) {
            cell!.textLabel!.text = charName as! String?
        } else {
            cell!.textLabel!.text = "Loading.."
            
            NetworkWrapper.sharedInstance.getCharacters(id: "\(index)", onSuccess: { (array) in
                
                let _json = JSON(array).dictionaryObject
                let authorN = _json?["name"] as? String
                self.charNames["\(index)"] = authorN
                cell?.textLabel?.text = authorN
                
            }, onFailure: { (error) in
                print("error in getting character name")
            })
        }
        return cell!
    }
}

