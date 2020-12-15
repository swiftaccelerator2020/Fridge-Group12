//
//  Item.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 7/12/20.
//

import Foundation

class Item: Codable {
    var name: String
    var quantity: String
    var isFavourite: Bool
    var expiresIn: Int
    
    
    init(name: String,quantity: String,isFavourite: Bool,expiresIn: Int) {
        self.name = name
        self.quantity = quantity
        self.isFavourite = isFavourite
        self.expiresIn = expiresIn
    }
    
    
    static func loadSampleData() -> [Item] {
        let friends = [
            Item(name: "Mushroom",quantity: "10 kg",isFavourite: false,expiresIn: 0),
            Item(name: "Chicken",quantity: "10 kg",isFavourite: false,expiresIn: 0),
            Item(name: "Fish",quantity: "10 kg",isFavourite: false,expiresIn: 0)
        ]
        return friends
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "items"
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print("💁‍♂️ Your plist is at: \(documentsPath.absoluteString)")
        return documentsPath.appendingPathComponent(plistName).appendingPathExtension("plist")
    }

    static func saveToFile(items: [Item]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedItems = try? propertyListEncoder.encode(items)
        try? encodedItems?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadFromFile() -> [Item]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedItemsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedItems = try? propertyListDecoder.decode(Array<Item>.self, from: retrievedItemsData) else { return nil }
        return decodedItems
    }
    
}

