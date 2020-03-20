//
//  BookLibraryTableViewCell.swift
//  Reading Challenge
//
//  Created by Süleyman Koçak on 20.03.2020.
//  Copyright © 2020 Suleyman Kocak. All rights reserved.
//

import UIKit

class BookLibraryTableViewCell: UITableViewCell {

    

  
    @IBOutlet weak var pageCountLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        author.numberOfLines = 0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
