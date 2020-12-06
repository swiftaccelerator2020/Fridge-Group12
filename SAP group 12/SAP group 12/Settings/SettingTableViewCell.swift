//
//  SettingTableViewCell.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 5/12/20.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    @IBOutlet weak var settingsView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
