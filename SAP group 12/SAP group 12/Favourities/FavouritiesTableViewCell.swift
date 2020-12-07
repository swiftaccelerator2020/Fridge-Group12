//
//  FavouritiesTableViewCell.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class FavouritiesTableViewCell: UITableViewCell {
    @IBOutlet weak var favouritiesView: UIView!
    
    @IBOutlet weak var favouritiesTitle: UILabel!
    @IBOutlet weak var favouritiesQuantity: UILabel!
    @IBOutlet weak var favouritiesMenu: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
