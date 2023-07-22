//
//  ViewController.swift
//  submitSwift
//
//  Created by csuftitan on 8/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBAction func btnClicked(_ sender: Any) {
        lbl.text = "Button tapped"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // background color
        //button.backgroundColor = UIColor.yellow
        
        // button text and color
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        // padding
        button.contentEdgeInsets = UIEdgeInsets(
            top: 10, left: 10, bottom: 10, right: 10)
        
        // border
        button.layer.borderColor =
            UIColor.darkGray.cgColor
        button.layer.borderWidth = 3.0
        
        // text font
        button.titleLabel!.font =
            UIFont.systemFont(ofSize: 26, weight:
            UIFont.Weight.regular)
        
        // rounder corners
        button.layer.cornerRadius = 10
        
        // auto adjust button size
        button.sizeToFit()
    }


}

