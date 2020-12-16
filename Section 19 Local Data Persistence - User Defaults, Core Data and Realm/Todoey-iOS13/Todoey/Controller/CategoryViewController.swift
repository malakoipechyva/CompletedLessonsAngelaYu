//
//  CategoryViewController.swift
//  Todoey
//
//  Created by malakoipechyva on 8.12.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
  
  let realm = try! Realm()
  
  var categories: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.separatorStyle = .none
      
      loadCategories()
    }
  
  //MARK: - TableView Datasource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories?.count ?? 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAt: indexPath)
    cell.textLabel?.text = categories?[indexPath.row].name ?? "no categories added yet"
    cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].color ?? "1D9BF6")
    
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
      newCategory.color = UIColor.randomFlat().hexValue()

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
  
  override func updateModel(at indexPath: IndexPath) {
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
}

