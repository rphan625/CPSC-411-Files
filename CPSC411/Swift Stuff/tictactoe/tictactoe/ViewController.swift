//
//  ViewController.swift
//  tictactoe
//
//  Created by csuftitan on 10/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var slot1: UIButton!
    @IBOutlet var slot2: UIButton!
    @IBOutlet var slot3: UIButton!
    @IBOutlet var slot4: UIButton!
    @IBOutlet var slot5: UIButton!
    @IBOutlet var slot6: UIButton!
    @IBOutlet var slot7: UIButton!
    @IBOutlet var slot8: UIButton!
    @IBOutlet var slot9: UIButton!
    var activePlayer = 1 //X = 1, O = 2
    var currentGrid = ["","","","","","","","","",]
    var gameActive = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NSLog("Viewcontroller has loaded")
        label.text = "Turn: X"
    }
    
    @IBAction func slot(_ sender: UIButton) {
//        label.text = String(sender.tag)
        if gameActive == true {
            if activePlayer == 1 { //Player 1
                if currentGrid[sender.tag-1] != "" {
                    label.text = "Spot taken"
                }
                else {
                    currentGrid[sender.tag-1] = "X"
                    if sender.tag == 1 {
                        slot1.setTitle("X", for: .normal)
                    }
                    if sender.tag == 2 {
                        slot2.setTitle("X", for: .normal)
                    }
                    if sender.tag == 3 {
                        slot3.setTitle("X", for: .normal)
                    }
                    if sender.tag == 4 {
                        slot4.setTitle("X", for: .normal)
                    }
                    if sender.tag == 5 {
                        slot5.setTitle("X", for: .normal)
                    }
                    if sender.tag == 6 {
                        slot6.setTitle("X", for: .normal)
                    }
                    if sender.tag == 7 {
                        slot7.setTitle("X", for: .normal)
                    }
                    if sender.tag == 8 {
                        slot8.setTitle("X", for: .normal)
                    }
                    if sender.tag == 9 {
                        slot9.setTitle("X", for: .normal)
                    }
                }
                if (currentGrid[0] == "X" && currentGrid[1] == "X" && currentGrid[2] == "X") || //Row 1
                   (currentGrid[3] == "X" && currentGrid[4] == "X" && currentGrid[5] == "X") || //Row 2
                   (currentGrid[6] == "X" && currentGrid[7] == "X" && currentGrid[8] == "X") || //Row 3
                   (currentGrid[0] == "X" && currentGrid[3] == "X" && currentGrid[6] == "X") || //Column 1
                   (currentGrid[1] == "X" && currentGrid[4] == "X" && currentGrid[7] == "X") || //Column 2
                   (currentGrid[2] == "X" && currentGrid[5] == "X" && currentGrid[8] == "X") || //Column 3
                   (currentGrid[0] == "X" && currentGrid[4] == "X" && currentGrid[8] == "X") || //LR diagonal
                   (currentGrid[2] == "X" && currentGrid[4] == "X" && currentGrid[6] == "X")    //RL diagonal
                {
                    label.text = "X WON"
                    gameActive = false
                }
                else {
                    label.text = "Turn: O"
                    activePlayer = 2
                }
            }
            else {                 //Player 2
                if currentGrid[sender.tag-1] != "" {
                    label.text = "Spot taken"
                }
                else {
                    currentGrid[sender.tag-1] = "O"
                    if sender.tag == 1 {
                        slot1.setTitle("O", for: .normal)
                    }
                    if sender.tag == 2 {
                        slot2.setTitle("O", for: .normal)
                    }
                    if sender.tag == 3 {
                        slot3.setTitle("O", for: .normal)
                    }
                    if sender.tag == 4 {
                        slot4.setTitle("O", for: .normal)
                    }
                    if sender.tag == 5 {
                        slot5.setTitle("O", for: .normal)
                    }
                    if sender.tag == 6 {
                        slot6.setTitle("O", for: .normal)
                    }
                    if sender.tag == 7 {
                        slot7.setTitle("O", for: .normal)
                    }
                    if sender.tag == 8 {
                        slot8.setTitle("O", for: .normal)
                    }
                    if sender.tag == 9 {
                        slot9.setTitle("O", for: .normal)
                    }
                }
                if (currentGrid[0] == "O" && currentGrid[1] == "O" && currentGrid[2] == "O") || //Row 1
                   (currentGrid[3] == "O" && currentGrid[4] == "O" && currentGrid[5] == "O") || //Row 2
                   (currentGrid[6] == "O" && currentGrid[7] == "O" && currentGrid[8] == "O") || //Row 3
                   (currentGrid[0] == "O" && currentGrid[3] == "O" && currentGrid[6] == "O") || //Column 1
                   (currentGrid[1] == "O" && currentGrid[4] == "O" && currentGrid[7] == "O") || //Column 2
                   (currentGrid[2] == "O" && currentGrid[5] == "O" && currentGrid[8] == "O") || //Column 3
                   (currentGrid[0] == "O" && currentGrid[4] == "O" && currentGrid[8] == "O") || //LR diagonal
                   (currentGrid[2] == "O" && currentGrid[4] == "O" && currentGrid[6] == "O")    //RL diagonal
                {
                    label.text = "O WON"
                    gameActive = false
                }
                else {
                    label.text = "Turn: X"
                    activePlayer = 1
                }
            }
        }
        else {
            NSLog("Game is already over")
        }
        print(currentGrid)
    }
}

