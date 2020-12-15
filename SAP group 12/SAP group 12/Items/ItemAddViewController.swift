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

    
//    var formatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.timeStyle = .none
//        formatter.dateStyle = .medium
//        return formatter
//    }
//    var simpleCurrentDate = ""
//    var simpleCurrentDateSplit: [Substring] = []
//    var simpleCurrentDateMonth = 0
//    var simpleCurrentDateDays: [Substring] = []
//    var simpleCurrentDateDay = 0
//    var simpleCurrentDateYear = 0
//
//    var simpleExpiryDate = ""
//    var simpleExpiryDateSplit: [Substring] = []
//    var simpleExpiryDateMonth = 0
//    var simpleExpiryDateDays: [Substring] = []
//    var simpleExpiryDateDay = 0
//    var simpleExpiryDateYear = 0
//
//    var expiresIn = 0
//
//    var months = [".","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//
//        simpleCurrentDate = formatter.string(from: currentDate)
//        simpleCurrentDateSplit = simpleCurrentDate.split(separator: " ")
//        simpleCurrentDateMonth = months.firstIndex(of: String(simpleCurrentDateSplit[0])) ?? 0
//        simpleCurrentDateDays = simpleCurrentDateSplit[1].split(separator: ",")
//        simpleCurrentDateDay = Int(simpleCurrentDateDays[0]) ?? 1
//        simpleCurrentDateYear = Int(simpleCurrentDateSplit[2]) ?? 2021
        
        
        

        
        

        
        
        
        
        // Do any additional setup after loading the view.
        
        
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
        
        
//        simpleExpiryDate = formatter.string(from: expiryDatePicker.date)
//        simpleExpiryDateSplit = simpleExpiryDate.split(separator: " ")
//        simpleExpiryDateMonth = months.firstIndex(of: String(simpleExpiryDateSplit[0])) ?? 0
//        simpleExpiryDateDays = simpleExpiryDateSplit[1].split(separator: ",")
//        simpleExpiryDateDay = Int(simpleExpiryDateDays[0]) ?? 1
//        simpleExpiryDateYear = Int(simpleExpiryDateSplit[2]) ?? 2021
//
//        expiresIn = (simpleExpiryDateYear - simpleCurrentDateYear)*365 + (simpleExpiryDateMonth - simpleCurrentDateMonth)*30 + (simpleExpiryDateDay - simpleCurrentDateDay)

        
        
        item = Item(name: nameTextField.text ?? "",
                    quantity: quantityTextField.text ?? "",
                    isFavourite: false,
                    expiresIn: diffs.day!)
        
        
        return true
    }
    
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "saveunwind" {
    //            item = Item(name: nameTextField.text ?? "",
    //                        quantity: quantityTextField.text ?? "",
    //                        isFavourite: false,
    //                        expiryDate: expiryDatePicker.date)
    //        }
    //    }
    
    
    
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

