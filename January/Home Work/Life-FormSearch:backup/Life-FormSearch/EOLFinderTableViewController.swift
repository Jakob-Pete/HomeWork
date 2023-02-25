//
//  FishFinderTableViewController.swift
//  Life-FormSearch
//
//  Created by mac on 1/20/23.
//

import UIKit

class EOLFinderTableViewController: UITableViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchTask: Task<Void, Never>? = nil
    
    var items = [EOLFetchItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    func fetchMatchingItems() {
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        
        if !searchTerm.isEmpty {
            let searchRequest = SearchRequest(searchTerm: searchTerm)
            searchTask?.cancel()
            searchTask = Task {
                do {
                    let searchResults = try await ControllerEOL.shared.sendRequest(searchRequest)
                    self.items = searchResults.results
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
                searchTask = nil
            }
        }
    }
    
    
    
    @IBSegueAction func showItemDetails(_ coder: NSCoder, sender: Any?) -> EOLPictureViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let item = items[indexPath.row]
        return EOLPictureViewController(coder: coder, item: item)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let item = items[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = item.name
        content.secondaryText = item.scientificName
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}

extension EOLFinderTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
