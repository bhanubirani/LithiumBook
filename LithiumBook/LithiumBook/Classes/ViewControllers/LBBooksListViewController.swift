//
//  LBBooksListViewController.swift
//  LithiumBook
//
//  Created by Bhanu.Birani on 3/10/17.
//  Copyright © 2017 MB Corp. All rights reserved.
//

import UIKit

class LBBooksListViewController: UIViewController {

    @IBOutlet weak var bookListTV: UITableView!
    
    fileprivate var bookList:[LBBookObject]?
    fileprivate let bookListInteractor = LBBookListInteractor.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookListInteractor.delegate = self
        bookListInteractor.fetchBooks()
    }
    
    func pushBookDetail(book: LBBookObject) {
        
        let charVC = self.storyboard?.instantiateViewController(withIdentifier: "LBCharactersViewController") as! LBCharactersViewController
        charVC.bookObject = book
        self.navigationController?.pushViewController(charVC, animated: true)
    }
}

extension LBBooksListViewController: BookListInteractorProtocol {
    
    func didRecieveBookList(books: [LBBookObject]) {
        self.bookList = books;
        self.bookListTV.reloadData()
    }
    
}

extension LBBooksListViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.bookList != nil) ? (self.bookList!.count) : 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let book = self.bookList?[indexPath.row]
        cell!.textLabel!.text = book?.name
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushBookDetail(book: (self.bookList?[indexPath.row])!)
    }
    
}
