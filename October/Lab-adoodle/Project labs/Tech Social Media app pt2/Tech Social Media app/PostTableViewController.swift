//
//  PostTableViewController.swift
//  Tech Social Media app
//
//  Created by mac on 11/2/22.
//

import UIKit

class PostTableViewController: UITableViewController {

    let socialMediaPosts = Post.posts
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return socialMediaPosts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> PostsTableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Posts") as! PostsTableViewCell
        
        let socialMediaPosts = socialMediaPosts[indexPath.row]
        
        cell.update(with: socialMediaPosts)
       return cell
    }
    

}
