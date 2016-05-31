//
//  DiscussableCell.swift
//  MVCDemo
//
//  Created by trvslhlt on 7/1/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit
import FontAwesome_swift

protocol Discussable {
    var topic: String { get }
    var interestingFact: String { get }
    var image: UIImage? { get }
    var color: UIColor? { get }
    var fontImage: Int? {get}
    
    func updateInterestingFact()
}

protocol ActiveCell {
    
    func cellWasUpdated(index:Int)
}

class DiscussableCell: UITableViewCell {
        
    @IBOutlet weak var theButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var factLabel: UILabel!
    var delegate: ActiveCell?
    var index:Int = 0
    
    
    func configureWithItem(item: Discussable, index:Int) {
        titleLabel?.text = item.topic
        factLabel?.text = item.interestingFact
        self.backgroundColor = item.color
        self.index = index
        
        theButton.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        if item.fontImage == 0{
        theButton.setTitle(String.fontAwesomeIconWithName(.Empire), forState: .Normal)
        }
        else {
             theButton.setTitle(String.fontAwesomeIconWithName(.Joomla), forState: .Normal)
            
        }
    }
    
    @IBAction func buttonHit(sender: AnyObject) {
        
        if let delegate_ = delegate {
            delegate_.cellWasUpdated(index)
        }
    }
    

}
