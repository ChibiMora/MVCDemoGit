//
//  ViewController.swift
//  MVCDemo
//
//  Created by trvslhlt on 7/1/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit
import Parse
import Bolts
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ActiveCell {
    
    @IBOutlet weak var tableView: UITableView!
    var items = [Discussable]() { didSet { tableView.reloadData() } }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [Discussable]()
        Alamofire.request(.GET, "https://api.myjson.com/bins/246ej")
            .responseJSON { response in
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    
                    let json = JSON(data: response.data!)
                    if let zooName = json[" zooName"].string {
                        //Now you got your value
                        print(zooName)
                    }
                    if let zooCost = json["zooCost"].int {
                        //Now you got your value
                        print(zooCost)
                    }
                if let animals = json["animals"].array{
                    for animal in animals {
                        let name = animal["animalName"].string
                        let isAnimal = animal["isAnimal"].bool
                        print(name)
                        if isAnimal! {
                            let animal = Animal(name:name!)
                            self.items.append(animal)
                        }else {
                            let plant = Plant(name:name!)
                            self.items.append(plant)
                        
                        }
                        
                    }
                }
                    
            }
            
    
    
      
     
//        let query = PFQuery(className: "Zoo")
//        
//        items = [Discussable]()
//        query.findObjectsInBackgroundWithBlock( { (NSArray results, NSError error) in
//            if error == nil {
//                for object in results! {
//                    let name = object["Name"] as! String
//                    let isAnimal = object["isAnimal"] as! Bool
//                    print(name)
//                    if isAnimal {
//                        let animal = Animal(name:name)
//                        self.items.append(animal)
//                    } else {
//                        let plant = Plant(name:name)
//                        self.items.append(plant)
//                    }
//                }
//            } else {
//                // Log details of the failure
//                print("\(error!.userInfo)")
//            }
//        })
//        items = [Animal(name: "Dog"), Plant(name: "Sunflower"), Animal(name: "Cat"), Animal(name: "Fish"),
//        Plant(name: "Hibiscus")]
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

