//
//  GroceryListViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class GroceryListViewController: UIViewController {

    @IBOutlet weak var groceryListTableView: UITableView!
    var groceryLists: [GroceryList] = []
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        groceryListTableView.delegate = self
        groceryListTableView.dataSource = self
        groceryListTableView.separatorStyle = .none
        
        if let loadedItems = GroceryList.loadFromFile() {
            groceryLists = loadedItems
            print("We found our friends!")
        } else {
            groceryLists = GroceryList.loadSampleData()
            print("No friends :( Making some up")
        }
    }
    

    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GroceryListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groceryListTableView.dequeueReusableCell(withIdentifier: "Grocery") as! GroceryListTableViewCell

        cell.groceryView.layer.cornerRadius = 15
        cell.groceryTitle.text = groceryLists[indexPath.row].name
        cell.groceryQuantity.text = groceryLists[indexPath.row].quantity
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
           groceryLists.remove(at: indexPath.row)
           GroceryList.saveToFile(groceries: groceryLists)
           tableView.deleteRows(at: [indexPath], with: .fade)
       } else if editingStyle == .none {
           // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
       }
   }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        performSegue(withIdentifier: "edit grocery", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit grocery"{
            
            let destination = segue.destination as! GroceryListAddEditViewController
            
            destination.grocery = groceryLists[row]
        
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindToMain" {
            let source = segue.source as! GroceryListAddEditViewController
            if source.newItem {
                groceryLists.append(source.grocery)
                GroceryList.saveToFile(groceries: groceryLists)
            }else{
                groceryLists[row] = source.grocery
            }
            self.groceryListTableView.reloadData()
            
        }
    }
    
}
