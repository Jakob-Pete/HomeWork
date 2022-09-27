//
//  ViewController.swift
//  Calculator
//
//  Created by mac on 9/2/22.
//

import UIKit

class ViewController: UIViewController {

    
    
   
    @IBOutlet weak var startValueLabel: UILabel!
    
    var firstNumber = ""
    var secondNumber = ""
    var opperand = ""
    
   
    @IBOutlet weak var clearButton: UIButton!
    
//    make a new func that takes in the math for the numbers pressed and then prints out the numbers added or devided and stuff like that.
    

    
    
    @IBAction func equationButtonTapped(_ sender: UIButton) {
        
        guard let percent = Double(startValueLabel.text!) else { return }
       
       

        switch sender.titleLabel?.text {
            
                    case "AC":
            startValueLabel.text = "0"
            
        case "+":
            firstNumber = startValueLabel.text!
            startValueLabel.text = "0"
            opperand = "+"
      
        case "/":
            firstNumber = startValueLabel.text!
            startValueLabel.text = "0"
            opperand = "/"

        case "+/-":
            startValueLabel.text = "\(percent * -1)"
           
        case "%":
            startValueLabel.text = "\(percent / 100)"
            

        case "X":
            firstNumber = startValueLabel.text!
            startValueLabel.text = "0"
            opperand = "X"
            

        case "-":
            firstNumber = startValueLabel.text!
            startValueLabel.text = "0"
            opperand = "-"

        case "=":
            switch opperand {
            case "+":
                secondNumber = (startValueLabel.text!)
                if let firstnumber = Double(firstNumber), let secondNumber = Double(secondNumber) {
                   let solution = firstnumber + secondNumber
                    startValueLabel.text = String(solution)
                    self.firstNumber = String(solution)
                }
                
                
                
            case "-":
                secondNumber = (startValueLabel.text!)
                if let firstNumber = Double(firstNumber), let secondNumber = Double(secondNumber) {
                    let solution = firstNumber - secondNumber
                    startValueLabel.text = String(solution)
                    self.firstNumber = String(solution)
                }

            case "X":
                secondNumber = (startValueLabel.text!)
                if let firstNumber = Double(firstNumber), let secondNumber = Double(secondNumber) {
                    let solution = firstNumber * secondNumber
                    startValueLabel.text = String(solution)
                    self.firstNumber = String(solution)
                }

            case "/":
                secondNumber = (startValueLabel.text!)
                if let firstNumber = Double(firstNumber), let secondNumber = Double(secondNumber) {
                    let solution = firstNumber / secondNumber
                    startValueLabel.text = String(solution)
                    self.firstNumber = String(solution)
                }


                
                
                
            default: print("ERROR")
            }
            
        default: print("ERROR")
        }
    }
    

   
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let labelText = startValueLabel.text, let newNum = sender.titleLabel?.text else {
            return
        }
        if labelText == "0" {
            startValueLabel.text = newNum
        } else {
            startValueLabel.text = labelText + newNum
        }
    }
    
    
    

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       }









}

