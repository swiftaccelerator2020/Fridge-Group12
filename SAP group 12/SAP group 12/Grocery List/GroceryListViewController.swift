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
    
    
}
