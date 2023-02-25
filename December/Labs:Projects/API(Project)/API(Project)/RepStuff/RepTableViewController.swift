//
//  RepTableViewController.swift
//  API(Project)
//
//  Created by mac on 12/7/22.
//

import UIKit

class RepTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
//    var success = false
    var results: [Rep] = []
    
    var controller = RepController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        tableView.reloadData()
        let searchRep = searchBar.text ?? ""
        
        let query = [
            "zip": searchRep,
            "output": "json"
        ]
        
        if !searchRep.isEmpty {
            
            Task {
                do {
                    results = try await controller.fetchItems(matching: query)
                    tableView.reloadData()
                } catch {
                    throw error
                }
            }
        }
    }
//    func searchBar(_ searchBar: UISearchBar,  searchText: String) {
//
//    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repView", for: indexPath) as! RepTableViewCell
//        print(results.count)
//        let rep = results[indexPath.row]
//        cell.repNameLable.text = rep.name
//        cell.stateLabel.text = rep.state
//        cell.linkLabel.text = rep.link
//        cell.partyLable.text = rep.party
        configure(cell: cell, forItemAt: indexPath)
//        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: RepTableViewCell, forItemAt indexPath: IndexPath) {
//
//        print(results.count)
//        switch success {
//        case true:
            let rep = results[indexPath.row]
            cell.repNameLable.text = rep.name
            cell.stateLabel.text = rep.state
            cell.linkLabel.text = rep.link
            cell.partyLable.text = rep.party
//        default:
//            cell.repNameLable.text = "ERROR"
//            cell.stateLabel.text = ""
//            cell.linkLabel.text = ""
//            cell.partyLable.text = ""
//        }
        
        //MARK: - Problem, I thjink its to do with this or the one above it on line 77 or 78
        
    }
//    func repsFailed() {
//        success = false
//        tableView.reloadData()
//    }
//    func repsSucceeded() {
//        success = true
//        tableView.reloadData()
//    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }
    

}
