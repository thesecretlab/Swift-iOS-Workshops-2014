//
//  TableViewController.swift
//  iOSTableView
//
//  Created by Jon Manning on 6/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // 1: Add navigation controller, make table view controller use class
    // 2: Set up cell to use identifier 'StringCell', use Basic style
    
    // 3: Add data
    var data = ["Once", "upon", "a", "time"]
    
    
    // 4: One section in this table view
        
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    // 5: Number of rows = number of data items
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // 6: Create the cell
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("StringCell", forIndexPath: indexPath) as UITableViewCell
        
        let string = data[indexPath.row]
        
        cell.textLabel.text = string
        
        return cell
    }
    
    // 7: Add + button
    
    // 8: Connect + button to this method
    
    @IBAction func addObject(sender: UIBarButtonItem) {
        let randomNumber = arc4random_uniform(100)
        
        let displayString = "Item \(randomNumber)"
        
        data.append(displayString)
        
        let newIndexPath = NSIndexPath(forRow: data.endIndex-1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Top)
    }

    // 9: Add Edit button:
    override func viewDidLoad() {
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
    }
    
    
    // 10: All cells can be edited
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    // 11: When an item is deleted, remove it from the array
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if editingStyle == .Delete {
            
            data.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
            
        }
        
        
    }
    
    // 12: Print out when a cell is selected
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)  {
        println("Selected \(data[indexPath.row])")
    }
    

}
