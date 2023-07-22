//
//  FavoriteViewController.swift
//  PhoneApp
//
//  Created by csuftitan on 10/17/22.
//

import UIKit

class FavoriteViewController : UIViewController, UITableViewDataSource {
    var favoriteItemStore: FavoriteItemStore!
    
    var data:[FavoriteItem] = [
        FavoriteItem(name: "Bobby Bill", phoneType: "Mobile", initialLabel: "BB"),
        FavoriteItem(name: "Steve Jobs", phoneType: "Phone", initialLabel: "SJ"),
        FavoriteItem(name: "Macey Keavy", phoneType: "Mobile", initialLabel: "MK"),
        FavoriteItem(name: "Keinan Lalka", phoneType: "Phone", initialLabel: "KL"),
        FavoriteItem(name: "Lore Fredrika", phoneType: "Mobile", initialLabel: "LF"),
        FavoriteItem(name: "Shalev Herakleios", phoneType: "Mobile", initialLabel: "SH"),
        FavoriteItem(name: "Ravinder Astraea", phoneType: "Phone", initialLabel: "RA"),
        FavoriteItem(name: "Ayan Gunna", phoneType: "Mobile", initialLabel: "AG"),
        FavoriteItem(name: "Agrafena Luciana", phoneType: "Mobile", initialLabel: "AL"),
        FavoriteItem(name: "Ventsislav Damion", phoneType: "Phone", initialLabel: "VD")
    ]
    
    @IBOutlet var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.rowHeight = 65
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {return 1; }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favoriteItemStore.favoriteAllItems.count
        return data.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        "Favorites"
//                    }
    
    func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = favoriteItemStore.favoriteAllItems[indexPath.row]
            // Remove the item from the store
            favoriteItemStore.removeItem(item)
            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
    // Update the model
    to destinationIndexPath: IndexPath) {
        favoriteItemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        NSLog("Add button pressed")
        let newItem = favoriteItemStore.createItem()
        if favoriteItemStore == nil {
            NSLog("This is nil!")
            NSLog("favoriteItemStore count", favoriteItemStore.favoriteAllItems.count)
        }
        else {
            data.append(newItem)
        }
        
//        if let index = favoriteItemStore.favoriteAllItems.firstIndex(of: newItem) {
//            let indexPath = IndexPath(row: index, section: 0)
//            tableView.insertRows(at: [indexPath], with: .automatic)
//        }
    }
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        NSLog("Edit button pressed")
        sender.setTitle(isEditing ? "Edit" : "Done", for: .normal)
        setEditing(!isEditing, animated:true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell with default appearance

        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteItemCell", for: indexPath) as! FavoriteItemCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
        
//        let item = favoriteItemStore.favoriteAllItems[indexPath.row]
        let favorite = data[indexPath.row]
        
        // Configure the cell with the Item
//        cell.nameLabel.text = item.name
        cell.nameLabel.text = favorite.name
//        cell.phoneTypeLabel.text = item.phoneType
        cell.phoneTypeLabel.text = favorite.phoneType
        cell.initialLabel.text = favorite.initialLabel
        cell.initialLabel.layer.masksToBounds = true
        cell.initialLabel.layer.cornerRadius = cell.initialLabel.frame.width/2
        return cell
    }
}
