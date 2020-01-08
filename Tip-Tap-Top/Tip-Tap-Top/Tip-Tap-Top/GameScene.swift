//
//  GameScene.swift
//  Tip-Tap-Top
//
//  Created by Student Laptop_7/19_1 on 1/7/20.
//  Copyright © 2020 Makeschool. All rights reserved.


import SpriteKit
import UIKit
import GameplayKit

class GameScene: SKScene {
    var score = 0
    //Set up properties of the scoreLabel
    var scoreLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.numberOfLines = 2
        label.text = "Score:0"
        label.color = .white
        label.fontName = "GillSans-SemiBold"
        label.fontSize = 50
        
        return label
    }()
    
    
    
    override func didMove(to view: SKView) {
        labelSetUp()
        self.backgroundColor = .black
    }
    
    func labelSetUp() {
        scoreLabel.position.x = view!.bounds.width / 2
        scoreLabel.position.y = view!.bounds.height - 60
        scoreLabel.zPosition = 1
        addChild(scoreLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        score += 1
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

import Foundation
