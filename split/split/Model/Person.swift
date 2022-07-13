//
//  People.swift
//  split
//
//  Created by Collin Qian on 7/8/22.
//
import Foundation

class Person {
    let name : String
    var pay : Double
    var foodList : [String]
    
    init (personName: String) {
        name = personName
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
