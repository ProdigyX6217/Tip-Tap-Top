//
//  GameScene.swift
//  Tip-Tap-Top
//
//  Created by Student Laptop_7/19_1 on 1/7/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import SpriteKit
import UIKit
import GameplayKit

class MenuScene: SKScene {
    
    //Set up properties of the scoreLabel
    var titleLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.numberOfLines = 2
        label.text = "Press Play\n To Begin"
        label.color = .white
        label.fontName = "GillSans-SemiBold"
        label.fontSize = 50
        
        return label
    }()
    
    var playButton: UIButton = {
        let b = UIButton()
        b.setTitle("Play", for: .normal)
        b.titleLabel?.font = UIFont(name: "GillSans-UltraBold" , size: 40)
        b.backgroundColor = .blue
        b.layer.cornerRadius = 15
        return b
    }()
    
    override func didMove(to view: SKView) {
        labelSetUp()
        self.backgroundColor = .black
    }
    
    func labelSetUp() {
        titleLabel.position.x = view!.bounds.width / 2
        titleLabel.position.y = view!.bounds.height - 150
        titleLabel.zPosition = 1
        addChild(titleLabel)
        

        playButton.frame = CGRect(x: 20, y: view!.bounds.height / 2, width: view!.bounds.width - 40, height: 60)
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        self.view!.addSubview(playButton)
    }
    
    @objc func playButtonPressed(){
        print("Play Button Tapped")
        playButton.removeFromSuperview()
        if let view = self.view {
            // Load the SKScene from 'GameScene.sks'
            let scene = GameScene(size: view.bounds.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
