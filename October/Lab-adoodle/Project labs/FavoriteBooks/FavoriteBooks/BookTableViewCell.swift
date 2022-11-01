//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by mac on 10/21/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleBookText: UILabel!
    @IBOutlet weak var lengthBookText: UILabel!
    @IBOutlet weak var genreBookText: UILabel!
    @IBOutlet weak var authorBookText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(book:Book) {
        titleBookText.text = book.title
        lengthBookText.text = book.length
        genreBookText.text = book.genre
        authorBookText.text = book.author
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
