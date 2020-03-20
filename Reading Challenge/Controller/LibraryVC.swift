//
//  LibraryVC.swift
//  Reading Challenge
//
//  Created by Süleyman Koçak on 19.03.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit
import CoreData
class LibraryVC: UITableViewController {

    var books = [BookLibrary]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadBooks()
    }
    func loadBooks(with request:NSFetchRequest<BookLibrary> = BookLibrary.fetchRequest()){
        do {
            self.books = try context.fetch(request)
        } catch{
            print(error)
        }
        tableView.reloadData()
    }
}
//MARK: - TableView Functions
extension LibraryVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookLibraryCell", for: indexPath) as! BookLibraryTableViewCell
        cell.author.text = books[indexPath.row].author
        cell.thumbnail.image = UIImage(data: books[indexPath.row].thumbnail!)
        cell.pageCountLabel.text = "Page Count : \(String(books[indexPath.row].pageCount))"
        cell.averageRatingLabel.text = "Rating : \(String(books[indexPath.row].averageRating))"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }




}
