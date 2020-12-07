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
        let friends = [
            GroceryList(name: "Mushroom",quantity: "10 kg"),
            GroceryList(name: "Chicken",quantity: "10 kg"),
            GroceryList(name: "Fish",quantity: "10 kg")
        ]
        return friends
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "grocerylist"
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print("💁‍♂️ Your plist is at: \(documentsPath.absoluteString)")
        return documentsPath.appendingPathComponent(plistName).appendingPathExtension("plist")
    }

    static func saveToFile(friends: [GroceryList]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadFromFile() -> [GroceryList]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedFriendsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedFriends = try? propertyListDecoder.decode(Array<GroceryList>.self, from: retrievedFriendsData) else { return nil }
        return decodedFriends
    }
    
}


