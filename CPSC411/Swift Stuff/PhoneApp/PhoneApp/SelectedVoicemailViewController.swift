//
//  SelectedVoicemailViewController.swift
//  PhoneApp
//
//  Created by csuftitan on 10/29/22.
//

import UIKit

class SelectedVoicemailViewController : UITableViewController {
    @IBOutlet var navigationBarItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var selectedVoicemailItemList:[SelectedVoicemailItems] = [
        SelectedVoicemailItems(selectedPhoneNumber: "+1 (213) 347-5682", date: "8/26/22", location: "Los Angeles, CA", time: "00:47"),
        SelectedVoicemailItems(selectedPhoneNumber: "+1 (323) 639-0369", date: "6/28/22", location: "Los Angeles,CA", time: "00:45"),
        SelectedVoicemailItems(selectedPhoneNumber: "+1 (814) 667-5703", date: "6/7/22", location: "Alexandria, PA", time: "00:35"),
        SelectedVoicemailItems(selectedPhoneNumber: "+1 (833) 636-1100", date: "2/19/22", location: "unknown", time: "00:11"),
        SelectedVoicemailItems(selectedPhoneNumber: "+1 (213) 640-8878", date: "9/8/21", location: "Los Angeles, CA", time: "00:50"),
        SelectedVoicemailItems(selectedPhoneNumber: "+1 (714) 774-9823", date: "1/23/22", location: "Vallarta, MX", time: "01:58"),
        SelectedVoicemailItems(selectedPhoneNumber: "+1 (659) 876-5432", date: "4/23/21", location: "Salt Lake City, NV", time: "00:12")
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedVoicemailItemList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectedVoicemailItemCells", for: indexPath) as! SelectedVoicemailItemCell
        cell.selectedVoicemailPhoneNumber.text = selectedVoicemailItemList[indexPath.row].selectedPhoneNumber
        cell.selectedVoicemailDate.text = selectedVoicemailItemList[indexPath.row].date
        cell.selectedVoicemailLocation.text = selectedVoicemailItemList[indexPath.row].location
        cell.selectedVoicemailTime.text = selectedVoicemailItemList[indexPath.row].time
        return cell
    }
}

