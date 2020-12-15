//
//  MainTabBarController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 6/12/20.
//

import UIKit

class MainTabBarController: UITabBarController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.unselectedItemTintColor = UIColor.black
        self.selectedIndex = 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
