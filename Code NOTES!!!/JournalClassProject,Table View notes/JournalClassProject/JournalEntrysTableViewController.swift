//
//  JournalEntrysTableViewController.swift
//  JournalClassProject
//
//  Created by Zander Ewell on 10/31/22.
//

import UIKit

class JournalEntrysTableViewController: UITableViewController {
    
    let journalEntries = JournalEntry.defaultEntries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        journalEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentJournalEntry = journalEntries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalEntryCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = currentJournalEntry.title
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath, var detailViewController = segue.destination as? ViewController else {
            fatalError()
        }
        detailViewController.entry = journalEntries[indexPath.row]
        
    }
    
}
