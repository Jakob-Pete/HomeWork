//
//  DisplayerUsersTableViewController.swift
//  Code Challenge 2# FindUserUpdated
//
//  Created by mac on 2/27/23.
//

import UIKit

class DisplayerUsersTableViewController: UITableViewController {
    var user: [User]
    
    
    init?(coder: NSCoder, user: [User]?) {
        self.user = user!
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.user = []
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "users", for: indexPath) as! UsersTableViewCell
        let userarray = user[indexPath.row]
        cell.updateUser(user: userarray)
        
        return cell
    }
}
