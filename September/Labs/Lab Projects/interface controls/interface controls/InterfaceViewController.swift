//
//  ViewController.swift
//  interface controls
//
//  Created by mac on 9/1/22.
//

import UIKit

class InterfaceViewController: UIViewController {

  // MARK: Properties and Outlets
  
    
    
// MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    
    }
// MARK: Actions

    
    @IBAction func sliderSlided(_ slider: UISlider) {
        if slider.value > 0.5 {
            self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = .blue
        }
    }
    
    
}
