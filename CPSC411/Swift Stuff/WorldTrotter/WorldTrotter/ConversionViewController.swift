//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by csuftitan on 10/10/22.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>? { didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            print("ConversionViewController loaded its view.")
        updateCelsiusLabel()
        }
        @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
            if let text = textField.text, let value = Double(text) {
                    fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
            } else {
                    fahrenheitValue = nil
            }
        }
        @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
            textField.resignFirstResponder()
    }
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = "\(celsiusValue.value)"
        } else {
            celsiusLabel.text = "???"
        }
    }

}

