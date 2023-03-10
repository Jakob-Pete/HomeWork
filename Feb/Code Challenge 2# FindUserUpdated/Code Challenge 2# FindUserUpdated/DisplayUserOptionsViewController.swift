//
//  DisplayUserOptionsViewController.swift
//  Code Challenge 2# FindUserUpdated
//
//  Created by mac on 2/27/23.
//

import UIKit

class DisplayUserOptionsViewController: UIViewController {
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var location: UISwitch!
    @IBOutlet weak var email: UISwitch!
    @IBOutlet weak var login: UISwitch!
    @IBOutlet weak var registered: UISwitch!
    @IBOutlet weak var dob: UISwitch!
    @IBOutlet weak var phoneNum: UISwitch!
    @IBOutlet weak var cell: UISwitch!
    @IBOutlet weak var id: UISwitch!
    @IBOutlet weak var nat: UISwitch!
    @IBOutlet weak var amountOfUsersTextField: UITextField!
    
    var findUsers = GetUser()
    var userArray: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getUsers() {
        var queryString = [String]()
        queryString.append("name")
        queryString.append("picture")
        if genderSwitch.isOn {
            queryString.append("gender")
        }
        if location.isOn {
            queryString.append("location")
        }
        if email.isOn {
            queryString.append("email")
        }
        if login.isOn {
            queryString.append("login")
        }
        if registered.isOn {
            queryString.append("registered")
        }
        if dob.isOn {
            queryString.append("dob")
        }
        if phoneNum.isOn {
            queryString.append("phone")
        }
        if cell.isOn {
            queryString.append("cell")
        }
        if id.isOn {
            queryString.append("id")
        }
        if nat.isOn {
            queryString.append("nat")
        }
        
        let query = [
            "inc": queryString.joined(separator: ","),
            "results": amountOfUsersTextField.text ?? "1"
        ]
        
        Task {
            do {
                userArray = try await findUsers.fetchItems(matching: query)
                //                when line 75 ends it performs the segue with the asoicted identifier
                performSegue(withIdentifier: "sendUsers", sender: self)
            } catch {
                print(error)
            }
        }
    }
    
    
    //    prepare here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "sendUsers",
              let vc = segue.destination as? DisplayerUsersTableViewController
        else { return }
        vc.user = userArray
        
    }
    @IBAction func saveOptions(_ sender: Any) {
        Task {
            getUsers()
        }
    }
    //    use the prepare func for here
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
