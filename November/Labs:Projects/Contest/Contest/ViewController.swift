//
//  ViewController.swift
//  Contest
//
//  Created by mac on 11/22/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if emailTextField.text?.isEmpty == true {
            makeThingsAnimate()
        } else {
            performSegue(withIdentifier: "contestSegue", sender: nil)
        }
    }
 
    private func makeThingsAnimate() {
        UIView.animate(withDuration: 0.1, animations: {
            let animate = CGAffineTransform(translationX: 10, y: 0)
            self.emailTextField.transform = animate
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.emailTextField.transform = CGAffineTransform.identity
            })
        }
    }
    
    
}

