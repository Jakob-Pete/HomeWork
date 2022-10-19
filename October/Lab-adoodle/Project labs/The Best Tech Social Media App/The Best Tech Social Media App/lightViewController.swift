//
//  lightViewController.swift
//  The Best Tech Social Media App
//
//  Created by mac on 10/5/22.
//

import UIKit

class lightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    
    @IBOutlet weak var settingsTab: UITabBarItem!
    
    var fT = false
   
    @IBAction func darkMode(_ sender: Any) {
        if fT == false {
            fT = true
            self.view.backgroundColor = .black
           
        } else {
            fT = false
            self.view.backgroundColor = .white
        }
    }
}
