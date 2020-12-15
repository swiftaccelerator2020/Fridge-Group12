//
//  ItemAddViewController.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 7/12/20.
//

import UIKit

class ItemAddViewController: UIViewController{
    
    @IBOutlet weak var expiryDatePicker: UIDatePicker!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    var item: Item!
    
    var currentDate = Date()

    



    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    
    
    
    @IBAction func doneEditingName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func doneEditingQuantity(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "saveunwind"{
            if nameTextField.text == "" || quantityTextField.text == "" {
                return false
                
            }
        }
        
        
        let diffs = Calendar.current.dateComponents([.day], from: currentDate, to: expiryDatePicker.date)
        
        


        
        
        item = Item(name: nameTextField.text ?? "",
                    quantity: quantityTextField.text ?? "",
                    isFavourite: false,
                    expiresIn: diffs.day!)
        
        
        return true
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

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}

