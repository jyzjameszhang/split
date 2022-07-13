//
//  Food.swift
//  split
//
//  Created by Collin Qian on 7/8/22.
//

import Foundation

class Food {
    let name : String
    let price : Double
    var splitCount : Double
    
    init (itemName: String, itemPrice: Double) {
        name = itemName
        price = itemPrice
        splitCount = 0
    }
    
    func getPrice() -> Double {
        return price
    }
    
    func getName() -> String {
        return name
    }
    
    func getCount() -> Double {
        return splitCount
    }
}
