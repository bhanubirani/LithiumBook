//
//  LBCharactersViewController.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit

class LBCharactersViewController: UIViewController {

    @IBOutlet weak var scharsTV: UITableView!
    public var bookObject: LBBookObject!
    
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
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel!.text = "Some char"
        return cell!
    }
}

