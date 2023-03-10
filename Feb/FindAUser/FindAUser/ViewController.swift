//
//  ViewController.swift
//  FindAUser
//
//  Created by mac on 2/24/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var nameArray: [String] = []
    
    @IBOutlet weak var inputNameTextField: UITextField!
    
    @IBOutlet weak var fetchedUser: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Users", for: indexPath)
        
        let names = nameArray[indexPath.row]
        
        cell.textLabel?.text = names
        
        return cell
    }
    
    
    @IBAction func addUserButton(_ sender: UIButton) {
        guard let newName = inputNameTextField.text, !newName.isEmpty else {
            return
        }
        
        nameArray.append(newName)
        tableView.reloadData()
        inputNameTextField.text = ""
    }
    
    @IBAction func getUserButton(_ sender: Any) {
//        if let random = nameArray.randomElement() {
//
//        }
        nameArray.randomElement()!
        
        fetchedUser.text = "Your user is: \(nameArray.randomElement()!)"
        
    }
    
    
}

