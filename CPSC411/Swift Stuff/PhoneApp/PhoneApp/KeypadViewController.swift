//
//  KeypadViewController.swift
//  PhoneApp
//
//  Created by csuftitan on 10/20/22.
//

import UIKit

class KeypadViewController : UIViewController {
    
    
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var oneBtn: UIButton!
    @IBOutlet var twoBtn: UIButton!
    @IBOutlet var threeBtn: UIButton!
    @IBOutlet var fourBtn: UIButton!
    @IBOutlet var fiveBtn: UIButton!
    @IBOutlet var sixBtn: UIButton!
    @IBOutlet var sevenBtn: UIButton!
    @IBOutlet var eightBtn: UIButton!
    @IBOutlet var nineBtn: UIButton!
    @IBOutlet var zeroBtn: UIButton!
    @IBOutlet var asteriskBtn: UIButton!
    @IBOutlet var poundBtn: UIButton!
    @IBOutlet var callBtn: UIButton!
    
    var phoneLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("KeypadViewController has loaded")
        phoneNumber.text = ""
        
        oneBtn.layer.cornerRadius = oneBtn.frame.width / 2
        oneBtn.layer.masksToBounds = true
        oneBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        twoBtn.layer.cornerRadius = oneBtn.frame.width / 2
        twoBtn.layer.masksToBounds = true
        twoBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        threeBtn.layer.cornerRadius = oneBtn.frame.width / 2
        threeBtn.layer.masksToBounds = true
        threeBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        fourBtn.layer.cornerRadius = oneBtn.frame.width / 2
        fourBtn.layer.masksToBounds = true
        fourBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        fiveBtn.layer.cornerRadius = oneBtn.frame.width / 2
        fiveBtn.layer.masksToBounds = true
        fiveBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        sixBtn.layer.cornerRadius = oneBtn.frame.width / 2
        sixBtn.layer.masksToBounds = true
        sixBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        sevenBtn.layer.cornerRadius = oneBtn.frame.width / 2
        sevenBtn.layer.masksToBounds = true
        sevenBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        eightBtn.layer.cornerRadius = oneBtn.frame.width / 2
        eightBtn.layer.masksToBounds = true
        eightBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        nineBtn.layer.cornerRadius = oneBtn.frame.width / 2
        nineBtn.layer.masksToBounds = true
        nineBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        zeroBtn.layer.cornerRadius = oneBtn.frame.width / 2
        zeroBtn.layer.masksToBounds = true
        zeroBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        asteriskBtn.layer.cornerRadius = oneBtn.frame.width / 2
        asteriskBtn.layer.masksToBounds = true
        asteriskBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        poundBtn.layer.cornerRadius = oneBtn.frame.width / 2
        poundBtn.layer.masksToBounds = true
        poundBtn.titleLabel?.font = .systemFont(ofSize: 48)
        
        callBtn.layer.cornerRadius = oneBtn.frame.width / 2
        callBtn.layer.masksToBounds = true
        callBtn.titleLabel?.font = .systemFont(ofSize: 48)
    }
    @IBAction func numBtn(_ sender: UIButton) {
        NSLog("Button pressed")
        if sender.tag == 13 {
            NSLog("callBtn pressed")
            phoneNumber.text = ""
            phoneLabel = ""
            
        }
        else if sender.tag != 11 && sender.tag != 12 && sender.tag != 13{
            phoneLabel += String(sender.tag-1)
            phoneNumber.text = phoneLabel
        }
        else if sender.tag == 11 {
            phoneLabel += "*"
            phoneNumber.text = phoneLabel
        }
        else if sender.tag == 12 {
            phoneLabel += "#"
            phoneNumber.text = phoneLabel
        }
    }
}
