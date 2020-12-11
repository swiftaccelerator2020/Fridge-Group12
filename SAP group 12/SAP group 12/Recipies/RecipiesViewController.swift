//
//  RecipiesViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class RecipiesViewController: UIViewController {
    
    var listOfRecipes: [RecipeItem] = []
    
    @IBOutlet weak var recipiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        recipiesTableView.delegate = self
        recipiesTableView.dataSource = self
        recipiesTableView.separatorStyle = .none
        
        // TODO: access array of food items to load recipes. This is a placeholder - zedong
        let searchFoodItems = ["potato", "tomato"]
        
        // run get recipes function
        getRecipes (foodItems: searchFoodItems) { (recipeResults) in
            if var recipeResults = recipeResults {
                // store array of all items
                var itemsLeftToCheck = recipeResults.results.count
                // using a for loop, check all links from item results and only append items with valid recipe links
                for i in 0...(recipeResults.results.count - 1) {
                    let urlToCheck = URL(string: "\(recipeResults.results[i].recipeLink)")!
                    checkWebsiteValid(url: urlToCheck) { (websiteIsValid) in
                        itemsLeftToCheck -= 1
                        if websiteIsValid! {
                            print(recipeResults.results[i])
                            var titleOfItem = recipeResults.results[i].title
                            // TODO - use regex to filter out non-spacebar white-space characters and others - zedong
                            /*
                            let regex = try! NSRegularExpression(pattern: "[\n]", options: [.caseInsensitive])
                            let mString = NSMutableString(string: titleOfItem)
                            regex.replaceMatches(in: mString, options: [], range: NSMakeRange(0, mString.length), withTemplate: "")
                            titleOfItem = String(mString)
                            titleOfItem = titleOfItem.filter {CharacterSet.decimalDigits.inverted.contains($0.unicodeScalars.first!)}
                            titleOfItem = titleOfItem.replacingOccurrences(of: "  ", with: " ")
                            print(titleOfItem)
                            recipeResults.results[i].title = titleOfItem
                            */
                            self.listOfRecipes.append(recipeResults.results[i])
                        }
                        if(itemsLeftToCheck == 0) {
                            // TODO: implement reloading table view here - zedong
                            DispatchQueue.main.async {
                                self.recipiesTableView.reloadData()
                            }
                            for item in self.listOfRecipes {
                                print(item)
                            }

                        }
                    }
                }
                
            }
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

extension RecipiesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.listOfRecipes.count)
        return self.listOfRecipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipiesTableView.dequeueReusableCell(withIdentifier: "Recipie") as! RecipieTableViewCell
        
        cell.recipieView.layer.cornerRadius = 10
        cell.titleTextLabel.text? = self.listOfRecipes[indexPath.row].title
        cell.descriptionTextLabel.text? = self.listOfRecipes[indexPath.row].recipeLink


        return cell
    }


}


