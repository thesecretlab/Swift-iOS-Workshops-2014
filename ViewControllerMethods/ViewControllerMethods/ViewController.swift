//
//  ViewController.swift
//  ViewControllerMethods
//
//  Created by Timothy Rodney Nugent on 28/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("viewWillDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

