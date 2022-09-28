//
//  ViewController.swift
//  Tally app
//
//  Created by mac on 9/27/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var addingNumbers: UITextField!
    
    @IBOutlet weak var numGoesUp: UILabel!
    
    var clicks = 0
    var value = 0
    
    var opperend = ""
    
    @IBAction func inputNum(_ sender: Any) {
        guard let numImport = Int(addingNumbers.text!)  else { return }
        value = numImport
    }
   
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "Reset": numGoesUp.text = "0"
            clicks = 0
            
    case "Tally it!":
           clicks += value
            numGoesUp.text = String(clicks)

        
    
        default:
            print("ERROR")
    }
}
        
        
//        if numGoesUp.text == "100" {
//            view.backgroundColor = .blue
//        } else if numGoesUp.text >= String(200) {
//            view.backgroundColor = .cyan
//    }

    
    
    
    
    
    
    
    
    
}

