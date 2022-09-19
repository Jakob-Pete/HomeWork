//
//  ViewController.swift
//  notesuiview
//
//  Created by mac on 9/19/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        namelabel.text = "hello world"
//        no crash yay
    }

    @IBOutlet weak var namelabel: UILabel!
    
    
    @IBAction func buttonWasTapped(_ sender: Any) {
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destintaion = segue.destination as? SecondViewController {
            destintaion.labelText = "hello world pt2"
        }
    }



}

