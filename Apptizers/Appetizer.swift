//
//  Appetizer.swift
//  Apptizers
//
//  Created by Denis Coder on 2/16/24.
//

import Foundation

// Decodable ? when we get json from the server we will decode that into our Appetizer object
// Identifiable ? It conformes the object Appetizer to be identifiable so can be used on elements like List()
struct Appetizer: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer, it is yummy",
                                           price: 9.99,
                                           imageURL: "String",
                                           calories: 99,
                                           protein: 78,
                                           carbs: 55
                                            )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
