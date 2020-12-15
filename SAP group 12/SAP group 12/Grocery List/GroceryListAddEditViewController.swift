//
//  GroceryListAddEditViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 14/12/20.
//

import UIKit

class GroceryListAddEditViewController: UIViewController {
    
    var grocery: GroceryList!
    var newItem = false

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if grocery != nil{
            self.title = "Edit Grocery"
            nameTextField.text = grocery.name
            quantityTextField.text = grocery.quantity
            
            
        } else{
            self.title = "Add Grocery"
            newItem = true
        }
    }
    
    
    @IBAction func doneEditingName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func doneEditingQuantity(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToMain" {
            if newItem {
                
             grocery = GroceryList(name: nameTextField.text ?? "",
                        quantity: quantityTextField.text ?? "")
                
            } else {
                grocery.name = nameTextField.text ?? ""
                grocery.quantity = quantityTextField.text ?? ""
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
