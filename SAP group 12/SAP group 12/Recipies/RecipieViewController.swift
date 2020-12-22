//
//  RecipieViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 7/12/20.
//

import UIKit
import SafariServices

class RecipieViewController: UIViewController {
    
    @IBOutlet var recipeTitle: UILabel!
    @IBOutlet var ingredientsTableView: UITableView!
    
    @IBOutlet weak var viewFullRecipieButton: UIButton!
    var recipeItem: RecipeItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTitle.text = recipeItem.title
        // Do any additional setup after loading the view.
        viewFullRecipieButton.layer.cornerRadius = 25
        
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
        if let url = URL(string: recipeItem.recipeLink) {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    
    func removeWhitespaceAndHyphen(_ string: String) -> String {
        var rstring = string
        let regex = try! NSRegularExpression(pattern: #"[\s-]"#, options: [.caseInsensitive])
        let mString = NSMutableString(string: rstring)
        regex.replaceMatches(in: mString, options: [], range: NSMakeRange(0, mString.length), withTemplate: "")
        rstring = String(mString)
        rstring = rstring.filter {CharacterSet.decimalDigits.inverted.contains($0.unicodeScalars.first!)}
        rstring = rstring.replacingOccurrences(of: "  ", with: " ")
        return rstring
        
    }
    
}

extension RecipieViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipeItem.ingredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: "recipeDetailCell") as! RecipeDetailTableViewCell
        let currentIngredient = recipeItem.ingredients[indexPath.row]
        cell.recipeIngredient.text? = currentIngredient
        
        if let loadedItems = Item.loadFromFile() {
            for i in 0...(loadedItems.count-1) {
                print("\n\n\n")
                print(removeWhitespaceAndHyphen(currentIngredient))
                print(removeWhitespaceAndHyphen(loadedItems[i].name))
                print("\n\n\n")
                if removeWhitespaceAndHyphen(currentIngredient) == removeWhitespaceAndHyphen(loadedItems[i].name) {
                    cell.ingredientPresent.image = UIImage(systemName:"circle.fill")
                    break
                } else if (i == loadedItems.count-1) {
                    cell.ingredientPresent.image = UIImage(systemName: "circle")
                    break
                }
            }
        }
        
        
        

        return cell
    }

    

}
