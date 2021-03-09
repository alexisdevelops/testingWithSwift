//
//  House.swift
//  FirstTestingProject
//
//  Created by alexis on 08/03/21.
//

import Foundation

struct House {
    var bedrooms: Int
    var bathrooms: Int
    var cost: Int
    
    init(bedrooms: Int, bathrooms: Int) {
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.cost = bedrooms * bathrooms * 50_000
    }
    
    func checkSuitability(desiredBedrooms: Int,
                          desiredBathrooms: Int) -> Bool {
        if bedrooms >= desiredBedrooms && bathrooms >=
            desiredBathrooms {
            return true
        } else {
            return false
        }
    }
}

