//
//  RecentsViewController.swift
//  PhoneApp
//
//  Created by csuftitan on 10/22/22.
//

import UIKit

class RecentsViewController:UIViewController, UITableViewDataSource {
    
    var data:[RecentItem] = [
        RecentItem(name: "Bobby Bill", phoneType: "Mobile", timeLabel: "Tuesday", phoneImage: ""),
        RecentItem(name: "Steve Jobs", phoneType: "Phone", timeLabel: "07:49", phoneImage: ""),
        RecentItem(name: "Macey Keavy", phoneType: "Work", timeLabel: "Yesterday", phoneImage: ""),
        RecentItem(name: "Keinan Lalka", phoneType: "Home", timeLabel: "Monday", phoneImage: ""),
        RecentItem(name: "Lore Fredrika", phoneType: "Phone", timeLabel: "Yesterday", phoneImage: ""),
        RecentItem(name: "+1(657) 278-...", phoneType: "Fullerton, CA", timeLabel: "Wednesday", phoneImage: ""),
        RecentItem(name: "Unknown Caller", phoneType: "Unknown", timeLabel: "Monday", phoneImage: ""),
        RecentItem(name: "Downtown Magnet", phoneType: "Work", timeLabel: "Yesterday", phoneImage: ""),
        RecentItem(name: "Dad", phoneType: "Home", timeLabel: "11:23", phoneImage: ""),
        RecentItem(name: "Mom", phoneType: "Home", timeLabel: "01:45", phoneImage: "")
    ]
    @IBOutlet var recentTable : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recentTable.dataSource = self
        recentTable.rowHeight = 65
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {return 1; }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favoriteItemStore.favoriteAllItems.count
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recentItemCell", for: indexPath) as! RecentItemCell
        
        let recent = data[indexPath.row]
        
        cell.recentNameLabel.text = recent.name
        cell.recentPhoneTypeLabel.text = recent.phoneType
        cell.recentTimeLabel.text = recent.timeLabel
        cell.recentPhoneImage.text = recent.phoneImage
        
        return cell
    }
}
