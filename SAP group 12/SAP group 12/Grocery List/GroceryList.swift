//
//  GroceryList.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 7/12/20.
//

import Foundation

class GroceryList: Codable {
    
    var name: String
    var quantity: String
    
    
    init(name: String,quantity: String) {
        self.name = name
        self.quantity = quantity
    }
    
    
    static func loadSampleData() -> [GroceryList] {
        let groceries = [
            GroceryList(name: "Mushroom",quantity: "10 kg"),
            GroceryList(name: "Chicken",quantity: "10 kg"),
            GroceryList(name: "Fish",quantity: "10 kg")
        ]
        return groceries
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "grocerylist"
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print("💁‍♂️ Your plist is at: \(documentsPath.absoluteString)")
        return documentsPath.appendingPathComponent(plistName).appendingPathExtension("plist")
    }

    static func saveToFile(groceries: [GroceryList]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedGroceries = try? propertyListEncoder.encode(groceries)
        try? encodedGroceries?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadFromFile() -> [GroceryList]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedGroceriesData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedGroceries = try? propertyListDecoder.decode(Array<GroceryList>.self, from: retrievedGroceriesData) else { return nil }
        return decodedGroceries
    }
    
}


