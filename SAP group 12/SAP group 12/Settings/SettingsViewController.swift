//
//  SettingsViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 5/12/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    var settingsLabels = ["Dark mode","get notifications reminder for expiring items","Get daily reccomendations","Get reccomendations for recipies"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       settingsTableView.delegate = self
       settingsTableView.dataSource = self
       settingsTableView.separatorStyle = .none
    }
    

    /*
    // MARK: - Navigationxsss
wd
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsLabels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "Setting") as! SettingTableViewCell

        cell.settingsView.layer.cornerRadius = 15
        cell.settingsLabel.text = settingsLabels[indexPath.row]



        return cell
    }


}
