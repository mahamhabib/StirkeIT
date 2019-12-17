//
//  ViewController.swift
//  StirkeIT
//
//  Created by Maha Habib on 17/12/2019.
//  Copyright © 2019 Maha Habib. All rights reserved.
//

import UIKit

class StrikeItViewController: UITableViewController {
    
    let itemArray = ["Simba is a blimp", "He needs to be fed", "He needs constant petting"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK  - Tableview Datasource Methods
    //We need to push the hard-typed array into the table via 2 methods:
    // Mehtod 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    // Method 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        print(itemArray[indexPath.row])
        return cell
    }
    // MARK - TableView Delegate Methods
    
    //Method we need to print the selected item on the table and animate the deselection
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(itemArray[indexPath.row])")
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    
    
}





