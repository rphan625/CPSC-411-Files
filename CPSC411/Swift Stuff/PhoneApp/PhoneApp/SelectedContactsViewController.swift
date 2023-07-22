//
//  SelectedContactsViewController.swift
//  PhoneApp
//
//  Created by csuftitan on 10/25/22.
//

import UIKit

class SelectedContactsViewController:UITableViewController {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var contactList:[SelectedContactsListsItems] = [
        SelectedContactsListsItems(selectedContactsName: "Abby"),
//        "A":"Abby",
        SelectedContactsListsItems(selectedContactsName: "Bob"),
//        "B":"Bob",
        SelectedContactsListsItems(selectedContactsName: "Carl"),
//        "C":"Carl",
        SelectedContactsListsItems(selectedContactsName: "David"),
//        "D":"David",
        SelectedContactsListsItems(selectedContactsName: "Earl"),
//        "E":"Earl",
        SelectedContactsListsItems(selectedContactsName: "Fred"),
//        "F":"Fred",
        SelectedContactsListsItems(selectedContactsName: "Greg"),
//        "G":"Greg",
        SelectedContactsListsItems(selectedContactsName: "Henry"),
//        "H":"Henry",
        SelectedContactsListsItems(selectedContactsName: "Ivan"),
//        "I":"Ivan",
        SelectedContactsListsItems(selectedContactsName: "John"),
//        "J":"John",
        SelectedContactsListsItems(selectedContactsName: "Kyle"),
//        "K":"Kyle",
        SelectedContactsListsItems(selectedContactsName: "Leon"),
//        "L":"Leon",
        SelectedContactsListsItems(selectedContactsName: "Meg"),
//        "M":"Meg",
        SelectedContactsListsItems(selectedContactsName: "Nigel"),
//        "N":"Nigel",
        SelectedContactsListsItems(selectedContactsName: "Opera"),
//        "O":"Opera",
        SelectedContactsListsItems(selectedContactsName: "Peter"),
//        "P":"Peter",
        SelectedContactsListsItems(selectedContactsName: "Quynh"),
//        "Q":"Quynh",
        SelectedContactsListsItems(selectedContactsName: "Rachel"),
//        "R":"Rachel",
        SelectedContactsListsItems(selectedContactsName: "Steve"),
//        "S":"Steve",
        SelectedContactsListsItems(selectedContactsName: "Terry"),
//        "T":"Terry",
        SelectedContactsListsItems(selectedContactsName: "Ulysses"),
//        "U":"Ulysses",
        SelectedContactsListsItems(selectedContactsName: "Vegan"),
//        "V":"Vegan",
        SelectedContactsListsItems(selectedContactsName: "West"),
//        "W":"West",
        SelectedContactsListsItems(selectedContactsName: "Xylophone"),
//        "X":"Xylophone",
        SelectedContactsListsItems(selectedContactsName: "Yolanda"),
//        "Y":"Yolanda",
        SelectedContactsListsItems(selectedContactsName: "Zebra")
//        "Z":"Zebra",
    ]
    
    var sortedList = [[String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String](), [String]()]
    var section:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        for i in contactList {
            print("In contactList", i.selectedContactsName)
            let firstLetter = String(i.selectedContactsName.prefix(1))
            switch(firstLetter) {
            case "A": sortedList[0].append(i.selectedContactsName)
            case "B": sortedList[1].append(i.selectedContactsName)
            case "C": sortedList[2].append(i.selectedContactsName)
            case "D": sortedList[3].append(i.selectedContactsName)
            case "E": sortedList[4].append(i.selectedContactsName)
            case "F": sortedList[5].append(i.selectedContactsName)
            case "G": sortedList[6].append(i.selectedContactsName)
            case "H": sortedList[7].append(i.selectedContactsName)
            case "I": sortedList[8].append(i.selectedContactsName)
            case "J": sortedList[9].append(i.selectedContactsName)
            case "K": sortedList[10].append(i.selectedContactsName)
            case "L": sortedList[11].append(i.selectedContactsName)
            case "M": sortedList[12].append(i.selectedContactsName)
            case "N": sortedList[13].append(i.selectedContactsName)
            case "O": sortedList[14].append(i.selectedContactsName)
            case "P": sortedList[15].append(i.selectedContactsName)
            case "Q": sortedList[16].append(i.selectedContactsName)
            case "R": sortedList[17].append(i.selectedContactsName)
            case "S": sortedList[18].append(i.selectedContactsName)
            case "T": sortedList[19].append(i.selectedContactsName)
            case "U": sortedList[20].append(i.selectedContactsName)
            case "V": sortedList[21].append(i.selectedContactsName)
            case "W": sortedList[22].append(i.selectedContactsName)
            case "X": sortedList[23].append(i.selectedContactsName)
            case "Y": sortedList[24].append(i.selectedContactsName)
            case "Z": sortedList[25].append(i.selectedContactsName)
            default:
                sortedList[0].append(i.selectedContactsName)
            }
        }
        print(sortedList)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 26
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedList[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
            case 0 : return "A"
            case 1 : return "B"
            case 2 : return "C"
            case 3 : return "D"
            case 4 : return "E"
            case 5 : return "F"
            case 6 : return "G"
            case 7 : return "H"
            case 8 : return "I"
            case 9 : return "J"
            case 10: return "K"
            case 11: return "L"
            case 12: return "M"
            case 13: return "N"
            case 14: return "O"
            case 15: return "P"
            case 16: return "Q"
            case 17: return "R"
            case 18: return "S"
            case 19: return "T"
            case 20: return "U"
            case 21: return "V"
            case 22: return "W"
            case 23: return "X"
            case 24: return "Y"
            case 25: return "Z"
            default:
                return "A"
            }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsListCell", for: indexPath) as! SelectedContactsListsCell
        cell.selectedContactsNameLabel.text = sortedList[indexPath.section][indexPath.row]
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var alphabetList = [String]()
        for i in alphabet {
            alphabetList.append(String(i))
        }
        return alphabetList
    }
}
