//
//  ItemTableViewCell.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 4/12/20.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var indicatorImageView: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var itemFavourite: UIButton!
    @IBOutlet weak var itemMeni: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        overrideUserInterfaceStyle = .light
        itemView.overrideUserInterfaceStyle = .light
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
