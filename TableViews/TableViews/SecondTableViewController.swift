//
//  SecondTableView.swift
//  TableViews
//
//  Created by Marty Kausas on 2/2/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import Foundation
import UIKit

class SecondTableViewController: UITableViewController {

    var secondArray = [String]()
    var secondAnswerArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("Cell2", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = secondArray[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!

        var destViewController = segue.destinationViewController as ViewController
        destViewController.firstString = secondAnswerArray[indexPath.row]
    }
}