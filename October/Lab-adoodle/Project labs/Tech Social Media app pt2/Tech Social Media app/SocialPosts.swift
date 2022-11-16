//
//  SocialPosts.swift
//  Tech Social Media app
//
//  Created by mac on 11/2/22.
//

import Foundation
import UIKit

struct Post{
    
    var image: UIImage
    var profilePic: UIImage
    var username: String
    var description: String
    
    
    static let posts: [Post] = [
        Post(image: UIImage(named: "Post 1")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Tryin to be fancy with an iPhone"),
        Post(image: UIImage(named: "Post 2")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Is this what they mean when they say pansexual"),
        Post(image: UIImage(named: "Post 3")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Water."),
        Post(image: UIImage(named: "Post 4")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Art"),
        Post(image: UIImage(named: "Post 5")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Lyin"),
        Post(image: UIImage(named: "Post 6")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Neat looking pic I took in texas"),
        Post(image: UIImage(named: "Post 7")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Fancy old church buliding, had great A/C."),
        Post(image: UIImage(named: "Post 8")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Breath of freshish air on the river"),
        Post(image: UIImage(named: "Post 9")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Nice ol flower"),
        Post(image: UIImage(named: "Post 10")!, profilePic: UIImage(named: "Profile pic")!, username: "yeeted", description: "Folks gathering around at a tree, what a tree-t")
    ]
    
}
