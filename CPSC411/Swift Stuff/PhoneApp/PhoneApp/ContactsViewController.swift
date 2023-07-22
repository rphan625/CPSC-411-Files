//
//  ContactsViewController.swift
//  PhoneApp
//
//  Created by csuftitan on 10/23/22.
//

//Make a NAVIGATION TABLE for Contacts and Voicemail for the navigation through view controllers

import UIKit

//class CustomSegue: UIStoryboardSegue {
//    override func perform() {
//
//        let src = self.source
//        let dst = self.destination
//        src.navigationController?.pushViewController(dst, animated: true)
//    }
//}

class ContactsViewController: UIViewController, UITableViewDataSource {
    
    var lists:[ContactsItem] = [
        ContactsItem(listName: "All Contacts", listContactCount: 26),
        ContactsItem(listName: "Gmail", listContactCount: 26),
        ContactsItem(listName: "All iCloud", listContactCount: 26)
    ]
    
    @IBOutlet var contactsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTable.dataSource = self
        contactsTable.rowHeight = 65
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "ContactsSegue", let destination = segue.destination as? ContactsViewController {
//            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
//                var affiliation = affiliations[indexPath.row]
//                destination.affiliation = affiliation
//            }
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsItemCell", for: indexPath) as! ContactsItemCell
        let contacts = lists[indexPath.row]
        
        cell.contactsListName.text = contacts.listName
        cell.contactsContactCount.text = String(contacts.listContactCount)
        return cell
    }
    
    
}
