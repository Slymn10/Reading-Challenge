//
//  ViewController.swift
//  Reading Challenge
//
//  Created by Süleyman Koçak on 18.03.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class ViewController: UITableViewController,UISearchBarDelegate{
    let url = "https://www.googleapis.com/books/v1/volumes?q="
    let key = "&key=AIzaSyDOte-w_XDcKd9rgq0Ub3Huz007kPReSYQ"
    var bookArray = [Item]()
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setNeedsStatusBarAppearanceUpdate()
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? "Not Found")

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
   
    

    //MARK: - getData
    func getData(url:String,bookTitle:String){
        let request = AF.request("\(url)\(bookTitle)\(key)")
        request.responseDecodable(of: Book.self) { (response) in
            if let books = response.value{
                for book in books.items{
                    self.bookArray.append(book)
                }
            }
            self.tableView.reloadData()
        }
    }
}

//MARK: - TableView Functions
extension ViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        cell.bookTitle.text = bookArray[indexPath.row].volumeInfo.title
        cell.thumbnail.sd_setImage(with: URL(string: bookArray[indexPath.row].volumeInfo.imageLinks.thumbnail))
        cell.authorTitle.text = bookArray[indexPath.row].volumeInfo.authors[0]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.index = indexPath.row
        performSegue(withIdentifier: "goToDetailVC", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailVC" {
            let destinationVC = segue.destination as! BookDetailViewController
            destinationVC.item = [bookArray[self.index]]
        }
    }


}

//MARK: - SearchBar Functions
extension ViewController{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            self.bookArray.removeAll(keepingCapacity: false)
            self.tableView.reloadData()
            searchBar.resignFirstResponder()
        }else{
            self.bookArray.removeAll(keepingCapacity: false)
            self.getData(url: self.url, bookTitle:searchBar.text!.removeWhitespace())
        }
    }


}

extension String {
  func replace(string:String, replacement:String) -> String {
      return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
  }
  func removeWhitespace() -> String {
      return self.replace(string: " ", replacement: "+")
  }
}

