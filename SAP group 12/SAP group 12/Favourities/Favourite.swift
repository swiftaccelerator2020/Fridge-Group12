//
//  Favourite.swift
//  SAP group 12
//
//  Created by Shanjiith Pranov on 7/12/20.
//

import Foundation


class Favourite: Codable {
    var name: String
    var quantity: String
    var isFavourite: Bool
    var expiryDate: Date
    
    
    init(name: String,quantity: String,isFavourite: Bool,expiryDate: Date) {
        self.name = name
        self.quantity = quantity
        self.isFavourite = isFavourite
        self.expiryDate = expiryDate
    }
    
    
    static func loadSampleData() -> [Favourite] {
        let friends = [
            Favourite(name: "Mushroom",quantity: "10 kg",isFavourite: false,expiryDate: Date()),
            Favourite(name: "Chicken",quantity: "10 kg",isFavourite: false,expiryDate: Date()),
            Favourite(name: "Fish",quantity: "10 kg",isFavourite: false,expiryDate: Date())
        ]
        return friends
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "favourite"
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print("💁‍♂️ Your plist is at: \(documentsPath.absoluteString)")
        return documentsPath.appendingPathComponent(plistName).appendingPathExtension("plist")
    }

    static func saveToFile(friends: [Favourite]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadFromFile() -> [Favourite]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedFriendsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedFriends = try? propertyListDecoder.decode(Array<Favourite>.self, from: retrievedFriendsData) else { return nil }
        return decodedFriends
    }
    
}

