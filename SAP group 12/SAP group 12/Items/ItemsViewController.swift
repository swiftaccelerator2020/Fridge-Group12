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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.separatorStyle = .none
        
        if let loadedItems = Item.loadFromFile() {
            items = loadedItems
            print("We found our friends!")
        } else {
            items = Item.loadSampleData()
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
    
    @IBAction func saveItem (with segue: UIStoryboardSegue) {
        if segue.identifier == "saveunwind", let source = segue.source as? ItemAddViewController {
            if source.item != nil {
                self.items.append(source.item)
                Item.saveToFile(items: items)
            }
            self.itemTableView.reloadData()
            
        }
    }
    
}
