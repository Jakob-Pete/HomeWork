//
//  FoodTableViewController.swift
//  Meal Tracker(Squirrel Tracker)
//
//  Created by mac on 10/18/22.
//

import UIKit

class FoodTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    var meals: [Meal] = [
        Meal(name: "Breakfast", food: [Food(name: "Waffles", description: "Crispy yet light like a cloud"), Food(name: "Eggs", description: "Sooooo fluffy you might cry")]),
        Meal(name: "Luuuuunch", food: [Food(name: "Zanders pet piggy", description: "Crispy and quite tasty, brings all the girls to the yard."),
                                      Food(name: "Watermelon", description: "Tasty and cool")]),
        Meal(name: "Din din", food: [Food(name: "Fish", description: "Slimy and moist")])
        ]
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)

        let mealList = meals[indexPath.section].food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(mealList.name)"
        content.secondaryText = "\(mealList.description)"
        
        
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    

}
