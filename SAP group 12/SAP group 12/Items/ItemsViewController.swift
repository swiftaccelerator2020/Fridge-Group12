//
//  ItemsViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 4/12/20.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    
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
        return 150
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "Item") as! ItemTableViewCell
        
        cell.itemView.layer.cornerRadius = 25
        
        // create tap gesture recognizer

        cell.itemTitle.text = items[indexPath.row].name
        cell.itemQuantity.text = items[indexPath.row].quantity
        
        return cell
    }
    
    
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            Item.saveToFile(items: items)
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
