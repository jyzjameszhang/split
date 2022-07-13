//
//  userDefaults.swift
//  split
//
//  Created by Collin Qian on 7/10/22.
//

import Foundation



let defaults = UserDefaults.standard

var personArr : [String:Person] = [:]

var foodArr : [String:Food] = [:]

var taxVar : Double?

func process() {
    for (tempPersonName, tempPerson) in personArr {
        for tempFood in tempPerson.foodList {
            tempPerson.pay += ((foodArr[tempFood]!.price)/(foodArr[tempFood]!.splitCount))
        }
        print(tempPerson.pay)
    }
}

