//
//  ViewController.swift
//  Calculatorv2
//
//  Created by csuftitan on 10/18/22.
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
    }

    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = ""
            label.text = label.text! + String(sender.tag-1)
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag-1)
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 {//Divide
                label.text = "/"
            }
            if sender.tag == 13 {//Multiply
                label.text = "x"
            }
            if sender.tag == 14 {//Subtract
                label.text = "-"
            }
            if sender.tag == 15 {//Add
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            performingMath = false
            operation = 0
        }
        else if sender.tag == 16 {
            numberOnScreen = Double(label.text!)!
            if operation == 12 {//Divide
                label.text = String(previousNumber / numberOnScreen)
            }
            if operation == 13 {//Multiply
                label.text = String(previousNumber * numberOnScreen)
            }
            if operation == 14 {//Subtract
                label.text = String(previousNumber - numberOnScreen)
            }
            if operation == 15 {//Add
                label.text = String(previousNumber + numberOnScreen)
            }
        }
    }
}

