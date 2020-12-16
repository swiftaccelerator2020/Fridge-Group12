//
//  RecipiesViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class RecipiesViewController: UIViewController {
    
    var listOfRecipes: [RecipeItem] = []
    var row = 0
    var searchFoodItems: [String] = []
    
    @IBOutlet weak var recipiesTableView: UITableView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear (_ animated: Bool) {

        // Do any additional setup after loading the view.

        recipiesTableView.delegate = self
        recipiesTableView.dataSource = self
        recipiesTableView.separatorStyle = .none
        
        self.loadingIndicator.startAnimating()
        self.loadingIndicator.isHidden = false
        
        if let loadedItems = Item.loadFromFile() {
            for item in loadedItems {
                self.searchFoodItems.append(item.name)
            }
        }
        self.listOfRecipes = []
        self.recipiesTableView.reloadData()
        // run get recipes function
        getRecipes (foodItems: self.searchFoodItems) { (recipeResults) in
            if var recipeResults = recipeResults {
                // store array of all items
                var itemsLeftToCheck = recipeResults.results.count
                // using a for loop, check all links from item results and only append items with valid recipe links
                for i in 0...(recipeResults.results.count - 1) {
                    let urlToCheck = "\(recipeResults.results[i].recipeLink)"
                    checkWebsiteValid(url: urlToCheck) { (websiteIsValid) in
                        itemsLeftToCheck -= 1
                        if websiteIsValid! {
                            print(recipeResults.results[i])
                            var titleOfItem = recipeResults.results[i].title
                            // regex function 1 - remove all whitespace characters that are not spacebar characters
                            let regex1 = try! NSRegularExpression(pattern: #"[\r\n\t\f\v]"#, options: [.caseInsensitive])
                            let mString1 = NSMutableString(string: titleOfItem)
                            regex1.replaceMatches(in: mString1, options: [], range: NSMakeRange(0, mString1.length), withTemplate: "")
                            titleOfItem = String(mString1)
                            titleOfItem = titleOfItem.filter {CharacterSet.decimalDigits.inverted.contains($0.unicodeScalars.first!)}
                            titleOfItem = titleOfItem.replacingOccurrences(of: "  ", with: " ")
                            
                            // regex function 2 - remove all whitespace characters at the start
                            let regex2 = try! NSRegularExpression(pattern: #"^\s*"#, options: [.caseInsensitive])
                            let mString2 = NSMutableString(string: titleOfItem)
                            regex2.replaceMatches(in: mString2, options: [], range: NSMakeRange(0, mString2.length), withTemplate: "")
                            titleOfItem = String(mString2)
                            titleOfItem = titleOfItem.filter {CharacterSet.decimalDigits.inverted.contains($0.unicodeScalars.first!)}
                            titleOfItem = titleOfItem.replacingOccurrences(of: "  ", with: " ")
                            
                            print(titleOfItem)
                            recipeResults.results[i].title = titleOfItem
                            self.listOfRecipes.append(recipeResults.results[i])
                        }
                        if(itemsLeftToCheck == 0) {
                            // TODO: implement reloading table view here - zedong
                            DispatchQueue.main.async {
                                self.loadingIndicator.stopAnimating()
                                self.loadingIndicator.isHidden = true
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        performSegue(withIdentifier: "showRecipe", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipe"{
            let destination = segue.destination as! RecipieViewController
            destination.recipeItem = listOfRecipes[row]
        
        }
    }

}


// segue identifier:  showRecipe
