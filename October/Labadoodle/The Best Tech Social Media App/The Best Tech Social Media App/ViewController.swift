//
//  ViewController.swift
//  The Best Tech Social Media App
//
//  Created by mac on 10/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    
    var fT = false
   
    @IBAction func darkMode(_ sender: Any) {
        if fT == false {
            fT = true
            self.view.backgroundColor = .black
        } else {
            fT = false
            self.view.backgroundColor = .blue
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

