//
//  TheWholeFamDamilyTableViewController.swift
//  family project 2
//
//  Created by mac on 11/1/22.
//

import UIKit

class TheWholeFamDamilyTableViewController: UITableViewController {

    let familyInfo = FamilyInfo.descriptionOfFam
    
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
        familyInfo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentFamilyInfo = familyInfo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyInfoCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = currentFamilyInfo.name
        
        cell.contentConfiguration = config  
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "show", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath, let detailViewController = segue.destination as? ViewController else {
            fatalError()
        }
        detailViewController.fam = familyInfo[indexPath.row]
    }

}
