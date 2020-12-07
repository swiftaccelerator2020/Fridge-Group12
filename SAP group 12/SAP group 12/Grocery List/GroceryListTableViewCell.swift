//
//  GroceryListTableViewCell.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class GroceryListTableViewCell: UITableViewCell {

    @IBOutlet weak var groceryView: UIView!
    @IBOutlet weak var groceryTitle: UILabel!
    @IBOutlet weak var groceryQuantity: UILabel!
    @IBOutlet weak var groceryMenu: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
