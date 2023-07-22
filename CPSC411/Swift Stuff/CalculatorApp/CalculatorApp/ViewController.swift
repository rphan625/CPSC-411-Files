//
//  ViewController.swift
//  CalculatorApp
//
//  Created by csuftitan on 10/13/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var value: UILabel!
    @IBOutlet var operationLabel: UILabel!
    @IBOutlet var prevResult: UILabel!
    var firstNum = 0
    var secondNum = 0
    var result  = ""
    var adding = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController has been loaded")
    }
    
    func addition(firstNum: Int, secondNum: Int) -> Int {
        return firstNum + secondNum
    }

    @IBAction func clearBtn(_ sender: Any) {
        print("clearBtn Pressed")
        value.text = "Value Goes Here"
        prevResult.text = "Previous Result: \(String(result))"
        result = ""
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        print("divBtn Pressed")
        value.text = "/"
        operationLabel.text = "dividing..."
    }
    
    @IBAction func multipleBtn(_ sender: Any) {
        print("mulBtn Pressed")
        value.text = "*"
        operationLabel.text = "multiplying..."
    }
    
    @IBAction func subBtn(_ sender: Any) {
        print("subBtn Pressed")
        value.text = "-"
        operationLabel.text = "subtracting..."
    }
    
    @IBAction func addBtn(_ sender: Any) {
        print("addBtn Pressed")
        value.text = "+"
        operationLabel.text = "adding..."
    }
    
    @IBAction func zeroBtn(_ sender: Any) {
        print("zeroBtn Pressed")
        result = result + "0"
        value.text = result
    }
    
    @IBAction func oneBtn(_ sender: Any) {
        print("oneBtn Pressed")
        result = result + "1"
        value.text = result
    }
    
    @IBAction func twoBtn(_ sender: Any) {
        print("twoBtn Pressed")
        result = result + "2"
        value.text = result
    }
    
    @IBAction func threeBtn(_ sender: Any) {
        print("threeBtn Pressed")
        result = result + "3"
        value.text = result
    }
    
    @IBAction func fourBtn(_ sender: Any) {
        print("fourBtn Pressed")
        result = result + "4"
        value.text = result
    }
    @IBAction func fiveBtn(_ sender: Any) {
        print("fiveBtn Pressed")
        result = result + "5"
        value.text = result
    }
    
    @IBAction func sixBtn(_ sender: Any) {
        print("sixBtn Pressed")
        result = result + "6"
        value.text = result
    }
    
    @IBAction func sevenBtn(_ sender: Any) {
        print("sevenBtn Pressed")
        result = result + "7"
        value.text = result
    }
    
    @IBAction func eightBtn(_ sender: Any) {
        print("eightBtn Pressed")
        result = result + "8"
        value.text = result
    }
    
    @IBAction func nineBtn(_ sender: Any) {
        print("nineBtn Pressed")
        result = result + "9"
        value.text = result
    }
    
}

