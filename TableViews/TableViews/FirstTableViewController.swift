//
//  ViewController.swift
//  TableViews
//
//  Created by Marty Kausas on 2/2/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    var firstTableArray = [String]()
    var secondArray = [SecondTable]()
    var thirdArray = [ThirdView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstTableArray = ["First", "Second", "Third", "Fourth"]
        
        secondArray = [
            SecondTable(secondTitle: ["firstfirst", "secondfirst", "thirdfirst"]),
            SecondTable(secondTitle: ["secondfirst", "secondsecond", "secondthird"]),
            SecondTable(secondTitle: ["thirdfirst", "thirdsecond", "thirdthird"]),
            SecondTable(secondTitle: ["thirdfirst"])
        ]
        
        thirdArray = [
            ThirdView(thirdViewArray: ["dhsakjdhsakh", "", ""]), // paired to firstfirst
            ThirdView(thirdViewArray: ["", "", ""]),
            ThirdView(thirdViewArray: ["", "", ""]),
            ThirdView(thirdViewArray: ["", "", ""])
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstTableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = firstTableArray[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        var destViewController = segue.destinationViewController as SecondTableViewController
        var secondTableArrayTwo : SecondTable
        secondTableArrayTwo = secondArray[indexPath.row]
        
        destViewController.secondArray = secondTableArrayTwo.secondTitle
        
        var thirdAnswerArray : ThirdView
        thirdAnswerArray = thirdArray[indexPath.row]

        destViewController.secondAnswerArray = thirdAnswerArray.thirdViewArray
    }

}

