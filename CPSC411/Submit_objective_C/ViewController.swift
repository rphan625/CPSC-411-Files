//
//  ViewController.swift
//  SubmitSwift
//
//  Created by William McCarthy on 27/8/2022.
//

import UIKit

class ViewController: UIViewController {

  var labelText = "Press the button"
  var labelShowing = true
  
  // MARK: - Action Items
  //      in objective-c...
  // is #pragma mark - Action Items
  
  @IBOutlet weak var btn: UIButton!
  
  @IBOutlet weak var lbl: UILabel!
  
  @IBAction func btnClicked(_ sender: Any) {
    labelShowing.toggle()
    showLabel()
  }
  
  func showLabel() {
    lbl.text = labelShowing ? labelText : "Button tapped"
  }
  
  // MARK: - Lifecycle Functions
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showLabel()
  }
  
  override func loadView() {
    super.loadView()
    
    btn.backgroundColor = UIColor.yellow
    
    btn.setTitle("Submit", for: .normal)
    btn.setTitleColor(.black, for: .normal)
  
// ignored since iOS 15
//    btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    btn.layer.borderColor = UIColor.darkGray.cgColor
    btn.layer.borderWidth = 3.0
    
    btn.titleLabel!.font =
    UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.regular)
    
    btn.layer.cornerRadius = 10
    
    btn.sizeToFit()
  }
}

