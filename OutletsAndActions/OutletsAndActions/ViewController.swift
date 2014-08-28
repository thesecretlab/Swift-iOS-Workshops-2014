//
//  ViewController.swift
//  OutletsAndActions
//
//  Created by Timothy Rodney Nugent on 28/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    // to keep track of what state the label is in
    var changed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        if (self.changed)
        {
            self.label.text = "Original Message!"
            self.changed = false
        }
        else
        {
            self.label.text = "New and Exciting Message!"
            self.changed = true
        }
    }


}

