//
//  FirstViewController.swift
//  To Do List
//
//  Created by Prateek Bhatt on 14/01/15.
//  Copyright (c) 2015 Prateek Bhatt. All rights reserved.
//

import UIKit

var toDoItems: [String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tasksTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell

        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        if var storedToDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") {
            
            toDoItems = []
            
            for var i = 0; i < storedToDoItems.count; ++i {
                toDoItems.append(storedToDoItems[i] as NSString)
            }
            
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoItems.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoItems")
            
            NSUserDefaults.standardUserDefaults().synchronize()
            
            
            tasksTable.reloadData()
            
        }
        
    }


}

