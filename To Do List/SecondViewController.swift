//
//  SecondViewController.swift
//  To Do List
//
//  Created by Prateek Bhatt on 14/01/15.
//  Copyright (c) 2015 Prateek Bhatt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newToDoItem: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoItems.append(newToDoItem.text)
        
        self.view.endEditing(true)
        
        newToDoItem.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoItems")
        
        NSUserDefaults.standardUserDefaults().synchronize()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}

