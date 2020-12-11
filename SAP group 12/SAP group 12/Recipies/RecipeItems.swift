//
//  RecipeItems.swift
//  SAP group 12
//
//  Created by Shaw Sheng Saw on 9/12/20.
//

import UIKit
import Foundation

// receives array of RecipeItem structs as API call return under "results"
struct RecipeItem: Codable {
    var title: String
    var recipeLink: String
    var ingredients: String
    var thumbnailLink: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case recipeLink = "href"
        case ingredients
        case thumbnailLink = "thumbnail"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.recipeLink = try valueContainer.decode(String.self, forKey: CodingKeys.recipeLink)
        self.ingredients = try valueContainer.decode(String.self, forKey: CodingKeys.ingredients)
        self.thumbnailLink = try valueContainer.decode(String.self, forKey: CodingKeys.thumbnailLink)
    }
}

// handles full API call return
struct RecipeResults: Codable {
    var results: [RecipeItem]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try valueContainer.decode([RecipeItem].self, forKey: CodingKeys.results)
    }
    
}

// function to call API
func getRecipes(foodItems: [String], completion: @escaping (RecipeResults?) -> Void) {
    var urlString = "http://www.recipepuppy.com/api/?i="
    for i in 0...(foodItems.count - 1) {
        if i == foodItems.count - 1 {
            urlString = "\(urlString)\(foodItems[i])"
        } else {
            urlString = "\(urlString)\(foodItems[i])"
            urlString = "\(urlString)%2C+"
        }
    }
    let url = URL(string: urlString)
    if let url = url {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data,
               let recipeResults = try? jsonDecoder.decode(RecipeResults.self, from: data)
            {
                completion(recipeResults)
            } else {
                // TODO: implement error handling for failed API call
                completion(nil)
            }
            
        }.resume()
    } else {
        completion(nil)
    }
}

// only list recipes with valid websites: function to check if a website returns 200 when called
func checkWebsiteValid(url: String, completion: @escaping (Bool?) -> Void) {
    let markedWebsites = ["recipezaar.com", "food.com", "grouprecipes.com", "cookeatshare.com", "bigoven.com", "allrecipes.com", "myrecipes.com"] // only pings websites within list - may need better error handling
    for i in 0...markedWebsites.count - 1 {
        print(url)
        print(url.contains(markedWebsites[i]))
        print("")
        if url.contains(markedWebsites[i]) == true {
            
            URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
                
            }.resume()
            break
        } else if i == markedWebsites.count - 1 {
            completion(false)
            break

        }
    }
    
    
}
