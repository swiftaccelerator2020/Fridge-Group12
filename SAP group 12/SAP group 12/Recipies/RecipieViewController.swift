//
//  RecipieViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 7/12/20.
//

import UIKit

class RecipieViewController: UIViewController {
    
    @IBOutlet var recipeTitle: UILabel!
    @IBOutlet var ingredientsTableView: UITableView!
    var recipeItem: RecipeItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTitle.text = recipeItem.title
        // Do any additional setup after loading the view.
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        ingredientsTableView.separatorStyle = .none
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func openRecipeButton(_ sender: Any) {
        
    }
    
}

extension RecipieViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipeItem.ingredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: "recipeDetailCell") as! RecipeDetailTableViewCell
        
        cell.recipeIngredient.text? = recipeItem.ingredients[indexPath.row]
        cell.ingredientIsPresent = true //todo - implement checking for ingredient presence? - zedong

        return cell
    }

    

}
