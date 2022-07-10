//
//  People.swift
//  split
//
//  Created by Collin Qian on 7/8/22.
//
import Foundation

class People {
    let name : String
    let venmo : String
    var pay : Double
    var foodList : [Food]
    
    init (personName: String, venmoAt: String) {
        name = personName
        venmo = venmoAt
        pay = 0
        foodList = []
    }
    
    func addFood(newItem: Food) {
        var foodPrice : Double;
        foodPrice = newItem.getPrice() * (1 / Double(newItem.getCount()))
        pay += foodPrice
    }
    
    func getPay() -> Double {
        return pay;
    }
    
}
