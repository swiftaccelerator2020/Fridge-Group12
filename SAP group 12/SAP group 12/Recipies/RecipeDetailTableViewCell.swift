//
//  RecipeDetailTableViewCell.swift
//  SAP group 12
//
//  Created by Shaw Sheng Saw on 15/12/20.
//

import UIKit

class RecipeDetailTableViewCell: UITableViewCell {
    @IBOutlet var ingredientPresent: UIImageView!
    @IBOutlet var recipeIngredient: UILabel!
    var ingredientIsPresent = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        if ingredientIsPresent {
//            ingredientPresent.image = UIImage(named:"circle")
//        }  else {
//            ingredientPresent.image = UIImage(named:"circle")
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
