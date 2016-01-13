//
//  FactFactory.swift
//  MVCDemo
//
//  Created by Bob Pascazio on 1/11/16.
//  Copyright © 2016 travis holt. All rights reserved.
//

import Foundation

class FactFactor {
    
    let facts:[String]
    var index = 0
    
    init(facts:[String]) {
       
        self.facts = facts
    }
    
    func getNextFact() -> String {
        
        let nextFact = self.facts[index]
        index = index + 1
        if index >= facts.count {
            index = 0
        }
        return nextFact
    }
    
}