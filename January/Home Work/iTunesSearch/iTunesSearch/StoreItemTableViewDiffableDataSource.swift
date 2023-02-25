//
//  StoreItemTableViewDiffableDataSource.swift
//  iTunesSearch
//
//  Created by mac on 1/27/23.
//

import Foundation
import UIKit
@MainActor
class StoreItemTableViewDiffableDataSource: UITableViewDiffableDataSource<String, StoreItem> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section]
    }
    
}
