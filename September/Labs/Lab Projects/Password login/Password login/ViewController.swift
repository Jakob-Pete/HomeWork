//
//  ViewController.swift
//  Password login
//
//  Created by mac on 9/29/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "workpls.jpeg")!)
        
        
    }

    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var usernameInput: UITextField!
    
    
    @IBAction func passwordInPutString(_ sender: Any) {
        
        guard let passwordTwo = passwordInput.text else { return }
        
        if isValidPassword(password: passwordTwo) {
            errorLabel.text = ""
            
        } else {
            errorLabel.text = "You need 8 or more characters, one capital and one lower case letter, a number, and a symbol"
        }
    }
    
    public func isValidPassword(password: String) -> Bool {
        
        
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,}"
        
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    @IBAction public func login() {
        guard let forPassword = passwordInput.text else { return }
        
        if isValidPassword(password: forPassword) {
            
            let alert = UIAlertController(title: "You're password passed", message: "Welcome", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Enter", style: .cancel, handler: { (_) in
                 }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Nah fam try again", message: "Password is invalid so do it again nerd", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay fine", style: .cancel, handler: { (_) in
                 }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

