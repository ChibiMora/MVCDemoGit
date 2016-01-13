//
//  DiscussableCell.swift
//  MVCDemo
//
//  Created by trvslhlt on 7/1/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit

protocol Discussable {
    var topic: String { get }
    var interestingFact: String { get }
    var image: UIImage? { get }
    var color: UIColor? { get }
    
    func updateInterestingFact()
}

protocol ActiveCell {
    
    func cellWasUpdated(index:Int)
}

class DiscussableCell: UITableViewCell {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var factLabel: UILabel!
    
    var delegate:ActiveCell?
    var index:Int = 0
    
    func configureWithItem(item: Discussable, index:Int) {
        titleLabel?.text = item.topic
        factLabel?.text = item.interestingFact
        self.backgroundColor = item.color
        self.index = index
    }
    
    @IBAction func buttonHit(sender: AnyObject) {
        
        if let delegate_ = delegate {
            delegate_.cellWasUpdated(index)
        }
    }
    

}
