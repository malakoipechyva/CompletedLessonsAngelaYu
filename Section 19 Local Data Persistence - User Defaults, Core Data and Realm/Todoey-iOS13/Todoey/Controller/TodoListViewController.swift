//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController, UISearchBarDelegate {
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

  var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
      print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
      loadItems()

    }
  //MARK: - TableView Datasource Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    let item = itemArray[indexPath.row]
    
    cell.textLabel?.text = item.title
    
    cell.accessoryType = item.done ? .checkmark : .none
    
    return cell
  }
  
  //MARK: - TabeView Delegate Methods
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
//    context.delete(itemArray[indexPath.row])
//    itemArray.remove(at: indexPath.row)
    
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
    saveItems()
     
    tableView.deselectRow(at: indexPath, animated: true)
  }


  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
      //what happen when user tap plus buttun
      let newItem = Item(context: self.context)
      newItem.title = textField.text!
      newItem.done = false
      
      self.itemArray.append(newItem)
      self.saveItems()
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new item"
      textField = alertTextField
    }
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  //MARK: - Model manipulation Methods
  
  func saveItems() {
    
    do {
      try context.save()
    } catch {
      print("error saving context: \(error.localizedDescription)")
    }
    tableView.reloadData()
  }
  
  func loadItems() {
    let request: NSFetchRequest<Item> = Item.fetchRequest()
    do {
      itemArray = try context.fetch(request)
    } catch {
      print("Error fetching data from context: \(error)")
    }
  }
  
}

