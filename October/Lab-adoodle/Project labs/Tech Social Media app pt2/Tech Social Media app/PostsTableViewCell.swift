//
//  PostsTableViewCell.swift
//  Tech Social Media app
//
//  Created by mac on 11/2/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionComment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with post: Post) {
        profilePic.image = post.profilePic
        postImage.image = post.image
        usernameLabel.text = post.username
        descriptionComment.text = post.description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
