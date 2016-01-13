//
//  ViewController.swift
//  MVCDemo
//
//  Created by trvslhlt on 7/1/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ActiveCell {
    
    @IBOutlet weak var tableView: UITableView!
    var items = [Discussable]() { didSet { tableView.reloadData() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [Animal(name: "Dog"), Plant(name: "Sunflower"), Animal(name: "Cat"), Animal(name: "Fish"),
        Plant(name: "Hibiscus")]
    }
    
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DiscussableCell
        cell.configureWithItem(items[indexPath.row], index:indexPath.row)
        cell.delegate = self
        return cell
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let row = indexPath.row
//        
//        items[row].updateInterestingFact()
//        tableView.reloadData()
//        
//    }
    
    func cellWasUpdated(index:Int) {
        
        items[index].updateInterestingFact()
        tableView.reloadData()
    }
}

