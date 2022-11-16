//
//  ViewController.swift
//  JournalClassProject
//
//  Created by Zander Ewell on 10/31/22.
//

import UIKit

class ViewController: UIViewController {

    var entry: JournalEntry?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        titleTextField.text = entry?.title
        bodyTextView.text = entry?.body
    }


}

