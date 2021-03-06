//
//  ItemsViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 4/12/20.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    
    let defaults = UserDefaults.standard
    
    
    var items: [Item] = []
    var row = 0
    static var usernameKey = "user name blah blah"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.separatorStyle = .none
        
        if let loadedItems = Item.loadFromFile() {
            items = loadedItems
            print("We found our friends!")
        } else {
            
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

extension ItemsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "Item") as! ItemTableViewCell
        
        cell.itemView.layer.cornerRadius = 25
        
        

        cell.itemTitle.text = items[indexPath.row].name
        cell.itemQuantity.text = items[indexPath.row].quantity

        
        if (items[indexPath.row].expiresIn <= 0){
            cell.indicatorImageView.tintColor = #colorLiteral(red: 0.8270000219, green: 0.1570000052, blue: 0.1330000013, alpha: 1)
            cell.itemExpiresIn.text = "Expired"
        } else if (items[indexPath.row].expiresIn < 10){
            cell.indicatorImageView.tintColor = #colorLiteral(red: 1, green: 0.6510000229, blue: 0.1879999936, alpha: 1)
            cell.itemExpiresIn.text = "Expires in " + String(items[indexPath.row].expiresIn) + " Days"
        } else {
            cell.indicatorImageView.tintColor = #colorLiteral(red: 0.175999999, green: 0.7059999704, blue: 0.3449999988, alpha: 1)
            cell.itemExpiresIn.text = "Expires in " + String(items[indexPath.row].expiresIn) + " Days"

        }
        

        
        return cell
    }
    
    
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            Item.saveToFile(items: items)
            defaults.set(true, forKey: "shouldReloadRecipes")
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .none {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    


    
    @IBAction func saveItem (with segue: UIStoryboardSegue) {
        if segue.identifier == "saveunwind", let source = segue.source as? ItemAddViewController {

            if source.item != nil {
                self.items.append(source.item)
                Item.saveToFile(items: items)
                defaults.set(true, forKey: "shouldReloadRecipes")
                
            }
            self.itemTableView.reloadData()
             print("###########___________##############")
            print("saved")
            print("###########___________##############")
            
        }
    }
    
    @IBAction func editItem (with segue: UIStoryboardSegue) {
    
        if segue.identifier == "editunwind", let source = segue.source as? ItemEditViewController {
            items[row].name = source.item.name
            items[row].quantity = source.item.quantity
            Item.saveToFile(items: items)
            defaults.set(true, forKey: "shouldReloadRecipes")
            print("###########___________##############")
            print("edited")
            print("###########___________##############")

            self.itemTableView.reloadData()
            


            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        performSegue(withIdentifier: "edit", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit"{
            
            let destination = segue.destination as! ItemEditViewController
            destination.item = items[row]
        
        }
    }
    
}
