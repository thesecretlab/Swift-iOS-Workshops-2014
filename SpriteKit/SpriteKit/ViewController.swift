//
//  ViewController.swift
//  SpriteKit
//
//  Created by Jonathon Manning on 12/08/2014.
//  Copyright (c) 2014 Jonathon Manning. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN scene_custom
        let scene = GameScene(size: self.view.bounds.size)
        
        let skView = self.view as SKView
        
        scene.scaleMode = .AspectFill
        scene.backgroundColor = UIColor.blackColor()
        
        skView.presentScene(scene)
        // END scene_basic
        
        
        
    }


}

