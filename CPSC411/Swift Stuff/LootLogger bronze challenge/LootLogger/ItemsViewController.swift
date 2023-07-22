//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by csuftitan on 9/26/22.
//

import UIKit

class ItemsViewController:UITableViewController {
//				var filteredItems = [[Item]()]
    var itemStore: ItemStore!
    
				override func numberOfSections(in tableView: UITableView) -> Int {return 2}
				
				override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
								section == 0 ? "Items <= $50" : "Items > $50"
								}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
//        return itemStore.allItems.count
								return itemStore.allItems[section].count
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
												let item = itemStore.allItems[indexPath.section][indexPath.row]
            // Remove the item from the store
            itemStore.removeItem(item)
            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
																												to destinationIndexPath: IndexPath) {
								// Update the model
        itemStore.moveItem(from: sourceIndexPath, to: destinationIndexPath)
    }
    
				@IBAction func toggleEditingMode(_ sender: UIButton) {
//        // If you are currently in editing mode...
        sender.setTitle(isEditing ? "Edit" : "Done", for: .normal)
        setEditing(!isEditing, animated:true)
    }
    
				@IBAction func addNewItem(_ sender: UIButton) {
        // Make a new index path for the 0th section, last row
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//        // Insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        // Create a new item and add it to the store
								let newItem = itemStore.createItem()
								let section = newItem.valueInDollars <= 50 ? 0 : 1
//								let filteredStore = itemStore.filterItemsBy(price: 50)
        // Figure out where that item is in the array
								if let index = itemStore.allItems[section].firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: section)
            // Insert this new row into the table
												tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell with default appearance
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
                for: indexPath)
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
//        let item = itemStore.allItems[indexPath.row]

								let item = itemStore.allItems[indexPath.section][indexPath.row]
								
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }
}
