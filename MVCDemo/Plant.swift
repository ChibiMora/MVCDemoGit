//
//  Plant.swift
//  MVCDemo
//
//  Created by trvslhlt on 7/1/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit

class Plant: NSObject, Discussable {
    
    //Discussable
    var topic: String { return "How about \(name)" }
    var interestingFact: String = "...searching..."
    var image: UIImage?
    var color: UIColor?
    
    let name: String
    
    let facts = FactFactor(facts: ["produces oxygen", "is green", "needs water"])
    
    init(name: String) {
        self.name = name
        super.init()
        searchForInterestingFact()
        self.color = UIColor.greenColor()
    }
    
    private func searchForInterestingFact() {
        interestingFact = facts.getNextFact()
    }
    
    func updateInterestingFact() {
        searchForInterestingFact()
    }
    
}
