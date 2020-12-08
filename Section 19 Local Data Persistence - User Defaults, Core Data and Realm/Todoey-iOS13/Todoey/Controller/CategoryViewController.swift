//
//  CategoryViewController.swift
//  Todoey
//
//  Created by malakoipechyva on 8.12.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
  var categories = [Category]()

  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
    override func viewDidLoad() {
        super.viewDidLoad()
      

      loadCategories()
    }
  
  //MARK: - TableView Datasource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
      cell.textLabel?.text = categories[indexPath.row].name
    
    return cell
  }
  //MARK: - TableView Delegate Methods
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "goToItems", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destionationVC = segue.destination as! TodoListViewController
    
    if let indexPath = tableView.indexPathForSelectedRow {
      destionationVC.selectedCategory = categories[indexPath.row]
    }
  }
  
  //MARK: - Add New Category
  
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    var texField = UITextField()
    
    let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "add", style: .default) { (action) in
      let newCategory = Category(context: self.context)
      newCategory.name = texField.text!
      
      self.categories.append(newCategory)
      self.saveCategories()
    }
    
    alert.addAction(action)
    alert.addTextField { (alertTextField) in
      texField = alertTextField
      texField.placeholder = "Create new category"
    }
    present(alert, animated: true, completion: nil)
  }
  
  
  //MARK: - Data Manipulation Methods
  
  func saveCategories() {
    do {
      try context.save()
    } catch {
      print("error saving context: \(error.localizedDescription)")
    }
    tableView.reloadData()
  }
  
  func loadCategories() {
    let request: NSFetchRequest<Category> = Category.fetchRequest()
    do {
      categories = try context.fetch(request)
    } catch {
      print("Error fetching data from context: \(error)")
    }
    tableView.reloadData()
  }
}
