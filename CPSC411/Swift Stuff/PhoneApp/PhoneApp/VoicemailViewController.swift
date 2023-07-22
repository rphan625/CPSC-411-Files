//
//  VoicemailViewController.swift
//  PhoneApp
//
//  Created by csuftitan on 10/28/22.
//

import UIKit

class VoicemailViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var voicemailList:[VoicemailItem] = [
        VoicemailItem(listName: "Deleted Messages"),
        VoicemailItem(listName: "Blocked Messages")
    ]
    
    @IBOutlet var voicemailTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voicemailList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "voicemailCells", for: indexPath) as! VoicemailItemCell
        let voicemails = voicemailList[indexPath.row]
        cell.voicemailGroupName.text! = voicemails.listName
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let displayViewController = storyboard!.instantiateViewController(withIdentifier: "selectedVoicemailViewController") as! SelectedVoicemailViewController
//        displayViewController.message =
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        voicemailTable.dataSource = self
        voicemailTable.rowHeight = 65
    }
}
