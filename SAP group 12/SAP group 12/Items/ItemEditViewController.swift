//
//  ItemEditViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 7/12/20.
//

import UIKit

class ItemEditViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    var item:Item!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        nameTextField.text = item.name
        quantityTextField.text = item.quantity
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if nameTextField.text != "" || quantityTextField.text != "" {
            
            if segue.identifier == "editunwind" {
                item.name = nameTextField.text ?? ""
                item.quantity = quantityTextField.text ?? ""
                
                
            }
        }
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
