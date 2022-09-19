//
//  ViewController.swift
//  Lab Login
//
//  Created by mac on 9/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Login" {
            segue.destination.navigationItem.title = username.text
            
        } else if segue.identifier == "forgotPassword" {
            segue.destination.navigationItem.title = "Forgot Password"
        } else {
            segue.destination.navigationItem.title = "Forgot Username"
        }
    
    }

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var forgotusername: UIButton!
    
    @IBOutlet weak var forgotpassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

