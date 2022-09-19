//
//  ViewController.swift
//  Interface builder lab
//
//  Created by mac on 9/1/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    
   
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        label.text = textField.text
  
    }

    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        label.text = " "
        textField.text = " "
    }
    
}

