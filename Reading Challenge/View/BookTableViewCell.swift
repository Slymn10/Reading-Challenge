//
//  BookTableViewCell.swift
//  Reading Challenge
//
//  Created by Süleyman Koçak on 18.03.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var authorTitle: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
