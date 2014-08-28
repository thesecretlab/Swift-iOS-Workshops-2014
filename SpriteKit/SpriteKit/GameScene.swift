//
//  GameScene.swift
//  SpriteKit
//
//  Created by Jonathon Manning on 12/08/2014.
//  Copyright (c) 2014 Jonathon Manning. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    
    
    override func didMoveToView(view: SKView!) {
        
        self.scaleMode = .AspectFill
        
        let label = SKLabelNode(text: "Hello")
        label.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        
        self.addChild(label)
        
        
        // Create the sprite
        let spriteNode = SKSpriteNode(imageNamed: "BlockSquareBlue")
        
        // Position the sprite right in the center of the scene
        spriteNode.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        
        // Add the sprite
        self.addChild(spriteNode)
        
        let textLabel = SKLabelNode(text: "This is some text")
                
        textLabel.fontName = "Zapfino"
        textLabel.fontSize = 30
        textLabel.fontColor = UIColor.yellowColor()
        
        // Position it at 1/2 of the width of the screen, 1/5 of the screen 
        // from the bottom
        textLabel.position = CGPoint(x: self.size.width / 2.0, y: self.size.height / 5.0)
        
        self.addChild(textLabel)
        
        // Move upwards by 50 pixels
        let moveAction = SKAction.moveBy(CGVector(dx: 0, dy:50), duration: 1.0)
        
        // Move down by 50 pixels
        let moveBackAction = moveAction.reversedAction()
                
        let moveSequence = SKAction.sequence([moveAction, moveBackAction])
        
        let repeatingMoveAction = SKAction.repeatActionForever(moveSequence)
        
        // Run an action on a node using runAction
        textLabel.runAction(repeatingMoveAction)
                
        // Shape nodes
        
        let shapeNode = SKShapeNode(rectOfSize: CGSize(width: 50.0, height: 50.0))
        
        shapeNode.lineWidth = 4.0
        shapeNode.lineCap = kCGLineCapRound
        shapeNode.fillColor = UIColor.redColor()
        shapeNode.glowWidth = 4.0
                
        shapeNode.position = CGPoint(x: 50, y: 100)
        
        self.addChild(shapeNode)
        
        // Image effects
        
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter.setDefaults()
        blurFilter.setValue(10.0, forKey: "inputRadius")
                
        let blurEffectNode = SKEffectNode()
        blurEffectNode.filter = blurFilter
        blurEffectNode.shouldEnableEffects = true
        self.addChild(blurEffectNode)

        shapeNode.removeFromParent()
        blurEffectNode.addChild(shapeNode)
        
        let body = SKPhysicsBody(rectangleOfSize: shapeNode.frame.size)
        shapeNode.physicsBody = body
        
                        
        body.mass = 1.0
                
        self.view.showsPhysics = true
                
        // Walls
        let wallsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = wallsBody
                
        // Joints
        let radius : CGFloat = 25.0
        let hingeNode = SKShapeNode(circleOfRadius: radius)
        hingeNode.position = CGPointMake(200, 400)
        
        let hingeBody = SKPhysicsBody(circleOfRadius: radius)
        hingeBody.dynamic = false

        hingeNode.physicsBody = hingeBody
        
        self.addChild(hingeNode)
                
        
        let pinJoint = SKPhysicsJointPin.jointWithBodyA(hingeNode.physicsBody, bodyB: shapeNode.physicsBody, anchor: hingeNode.position)

        self.physicsWorld.addJoint(pinJoint)
                
        
        
                
    }
    
    
    
}
