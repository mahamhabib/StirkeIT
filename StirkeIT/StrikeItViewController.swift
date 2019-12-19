//
//  ViewController.swift
//  StirkeIT
//
//  Created by Maha Habib on 17/12/2019.
//  Copyright © 2019 Maha Habib. All rights reserved.
//

import UIKit

class StrikeItViewController: UITableViewController {
    
    var itemArray = ["Simba is a blimpa", "He needs to be fed", "He needs constant petting"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "Item List") as? [String] {
            itemArray = items
        }
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
        // MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Items", message: "", preferredStyle: .alert)
        //Completion Function
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when the user clicks the Add item on our UIAlert
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "Item List")
                
            self.tableView.reloadData()
        }
        //adding a textField to our Alert Controller
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type New Item Here"
           textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}





