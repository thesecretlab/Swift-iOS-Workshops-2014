//
//  ViewController.swift
//  NavigationControllersAndSegues
//
//  Created by Timothy Rodney Nugent on 28/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func programmaticSegue(sender: AnyObject) {
        self.performSegueWithIdentifier("showSegue", sender: self)
    }
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            // code to run after completing the dimissing
        })
    }
    @IBAction func pop(sender: AnyObject) {
        self.navigationController.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // perform any setup for the next view controller
        println("preparing for \(segue.identifier), moving from \(sender) to \(segue.destinationViewController)")
    }
    
}

