//
//  CategoryViewController.swift
//  Todoey
//
//  Created by malakoipechyva on 8.12.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class CategoryViewController: UITableViewController {
  
  let realm = try! Realm()
  
  var categories: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
      
      loadCategories()
      tableView.rowHeight = 80
    }
  
  //MARK: - TableView Datasource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories?.count ?? 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! SwipeTableViewCell
    cell.delegate = self
    cell.textLabel?.text = categories?[indexPath.row].name ?? "no categories added yet"
    
    return cell
  }
  //MARK: - TableView Delegate Methods
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "goToItems", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destionationVC = segue.destination as! TodoListViewController
    
    if let indexPath = tableView.indexPathForSelectedRow {
      destionationVC.selectedCategory = categories?[indexPath.row]
    }
  }
  
  //MARK: - Add New Category
  
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    var texField = UITextField()
    
    let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "add", style: .default) { (action) in
      let newCategory = Category()
      newCategory.name = texField.text!

      self.save(category: newCategory)
    }
    
    alert.addAction(action)
    alert.addTextField { (alertTextField) in
      texField = alertTextField
      texField.placeholder = "Create new category"
    }
    present(alert, animated: true, completion: nil)
  }
  
  
  //MARK: - Data Manipulation Methods
  
  func save(category: Category) {
    do {
      try realm.write {
        realm.add(category)
      }
    } catch {
      print("error saving context: \(error.localizedDescription)")
    }
    tableView.reloadData()
  }
  
  func loadCategories() {
    
    categories = realm.objects(Category.self)

    tableView.reloadData()
  }
}

extension CategoryViewController: SwipeTableViewCellDelegate {
  
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
      guard orientation == .right else { return nil }

      let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
          // handle action by updating model with deletion
        if let categoryForDeletion = self.categories?[indexPath.row] {
          do {
            try self.realm.write {
              self.realm.delete(categoryForDeletion)
            }
          } catch {
            print("Deletion Error \(error)")
          }
        }
      }

      // customize the action appearance
      deleteAction.image = UIImage(named: "delete-icon")
      return [deleteAction]
  }
  
  func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
      var options = SwipeOptions()
      options.expansionStyle = .destructive
      return options
  }
}
