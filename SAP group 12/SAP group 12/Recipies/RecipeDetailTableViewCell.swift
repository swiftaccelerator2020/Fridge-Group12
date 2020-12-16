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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
