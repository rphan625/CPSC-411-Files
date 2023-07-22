//
//  ViewController.swift
//  Thermometer
//
//  Created by csuftitan on 12/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userTemp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    class Thermometer {
        var areaName = ""
        var temperature = 0
        
        func register(name: String, temp: Int) {
            areaName = name
            temperature = temp
        }
        
        
    }
    
    
    
    


}

