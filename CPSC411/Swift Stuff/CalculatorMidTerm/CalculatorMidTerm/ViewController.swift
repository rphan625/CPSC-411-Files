//
//  ViewController.swift
//  CalculatorMidTerm
//
//  Created by csuftitan on 10/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath:Bool = false
    var operation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = ""
    }

    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = ""
            label.text = label.text! + String(sender.tag-1)
            label.text = String(sender.tag-1)
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag-1)
        }
        
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if sender.tag != 11 && sender.tag != 16 {
            operation = sender.tag
            performingMath = true
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 { //Divide
                label.text = "/"
            }
            if sender.tag == 13 { //Multiply
                label.text = "X"
            }
            if sender.tag == 14 { //Subtract
                label.text = "-"
            }
            if sender.tag == 15 { //Add
                label.text = "+"
            }
        }
        else if sender.tag == 11 {
            previousNumber = 0
            numberOnScreen = 0
            label.text = ""
            operation = 0
            performingMath = false
        }
        else if sender.tag == 16 {
            numberOnScreen = Double(label.text!)!
            if operation == 12 {//Divide
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {//Multiply
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {//Subtract
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {//Add
                label.text = String(previousNumber + numberOnScreen)
            }
        }
//        else if sender.tag == 17 {
//            if label.text == "0" {
//                label.text = label.text
//            }
//            else if Double(label.text!)! > 0 {//positive -> negative
//                label.text = "-" + label.text!
//            }
//            else if Double(label.text!)! < 0 {//negative -> positive
//                label.text = label.text.dropFirst()
//            }
            
//        }
//        else if sender.tag == 18 { //percentage
//
//        }
        
    }
    
}

