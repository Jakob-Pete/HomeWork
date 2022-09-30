//
//  ViewController.swift
//  Tally app
//
//  Created by mac on 9/27/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addingNumbers.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return addingNumbers.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    func testTap() {
    let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tapGesture)
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

