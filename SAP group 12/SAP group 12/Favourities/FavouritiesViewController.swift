//
//  FavouritiesViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class FavouritiesViewController: UIViewController {

    @IBOutlet weak var favouritiesTableView: UITableView!
    
    var favourities: [Favourite] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ItemsViewController.usernameKey = "i dont"

        // Do any additional setup after loading the view.
        favouritiesTableView.delegate = self
        favouritiesTableView.dataSource = self
        favouritiesTableView.separatorStyle = .none
        
        
        if let loadedItems = Favourite.loadFromFile() {
            favourities = loadedItems
            print("We found our friends!")
        } else {
            favourities = Favourite.loadSampleData()
            print("No friends :( Making esome up")
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
extension FavouritiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouritiesTableView.dequeueReusableCell(withIdentifier: "Favourite") as! FavouritiesTableViewCell

        cell.favouritiesView.layer.cornerRadius = 15
        
        cell.favouritiesTitle.text = favourities[indexPath.row].name
        cell.favouritiesQuantity.text = favourities[indexPath.row].quantity
        
        
        
        return cell
    }
    
    
}

