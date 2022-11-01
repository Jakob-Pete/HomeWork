//
//  ViewController.swift
//  family project 2
//
//  Created by mac on 11/1/22.
//

import UIKit

class ViewController: UIViewController {

    var fam: FamilyInfo?
    
    @IBOutlet weak var imagieView: UIImageView!
    
    
    @IBOutlet weak var textLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagieView.image = fam?.image
        textLabel.text = fam?.description
        
    }


}

