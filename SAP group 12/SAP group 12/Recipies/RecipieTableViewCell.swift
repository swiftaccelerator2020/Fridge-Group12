//
//  RecipieTableViewCell.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class RecipieTableViewCell: UITableViewCell {

    @IBOutlet weak var recipieView: UIView!
    @IBOutlet var titleTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
