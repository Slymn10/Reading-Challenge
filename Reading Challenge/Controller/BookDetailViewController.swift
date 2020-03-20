//
//  BookDetailViewController.swift
//  Reading Challenge
//
//  Created by Süleyman Koçak on 19.03.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit
import SDWebImage
import CoreData
class BookDetailViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var addToLibraryButton: UIButton!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var bookImage: UIImageView!

    var item = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()


        dismissButton.layer.cornerRadius = 10
        addToLibraryButton.layer.cornerRadius = 10
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)

        bookImage.sd_setImage(with: URL(string:self.item[0].volumeInfo.imageLinks.thumbnail))
        bookDescription.text = item[0].volumeInfo.description
        bookDescription.layer.borderWidth = 2
        bookDescription.layer.borderColor = UIColor(red:0.97, green:0.70, blue:0.17, alpha:1.00).cgColor
    }
    


    @IBAction func dismissButtonPressed(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToLibraryButtonPressed(_ sender: UIButton) {
        self.saveBookToLibrary(data: (bookImage.image?.pngData())!)
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - CoreData
extension BookDetailViewController{
    func saveBookToLibrary(data: Data) {
        let book = BookLibrary(context:context)
        book.thumbnail = data
        book.author = item[0].volumeInfo.authors[0]
        book.bookDescription = item[0].volumeInfo.description ?? "No Description"
        book.title = item[0].volumeInfo.title
        book.pageCount = Int32(item[0].volumeInfo.pageCount ?? 0)
        book.averageRating = item[0].volumeInfo.averageRating ?? 0.0
        do {
            try context.save()
            print("Book is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
}
