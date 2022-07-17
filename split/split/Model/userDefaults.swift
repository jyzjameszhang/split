//
//  userDefaults.swift
//  split
//
//  Created by Collin Qian on 7/10/22.
//

import Foundation



let defaults = UserDefaults.standard

var personDic : [String:Person] = [:]

var personArr : [String] = []

var foodDic : [String:Food] = [:]

var foodArr : [String] = []

var taxVar : Double?

func process() {
    for (_, tempPerson) in personDic {
        for tempFood in tempPerson.foodList {
            tempPerson.pay += ((foodDic[tempFood]!.price)/(foodDic[tempFood]!.splitCount))
        }
        print(tempPerson.pay)
    }
}

