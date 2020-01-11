//
//  GameScene.swift
//  Tip-Tap-Top
//
//  Created by Student Laptop_7/19_1 on 1/7/20.
//  Copyright © 2020 Makeschool. All rights reserved.

import Foundation
import SpriteKit
import UIKit
import GameplayKit

class GameScene: SKScene {
    
    // There are Two types of Time Intervals:
    //   1. Level: 10 seconds
    //   2. Break: 3 seconds
    enum Levels {
        case Level1, Level2, Level3, Level4, Level5
        case Break
    }
    
    
    //  Tracking enum for use with Character and Monster side
    enum Side {
        case left, right, none
    }
    
    
    // Array of intervals that make up Game specifying if it's a Break or New Level
    let intervals: [Levels] = [.Level1,.Break,.Level2,.Break,.Level3,.Break,.Level4,.Break,.Level5]
    
    // Keeps track of where we are in the intervals
    var currentInterval = 0
    
    // Setting the duration of each Interval Type
    let levelDuration = 30 // Real: 30 * 60
    let breakDuration = 3 //Real:  5 * 60
    
    var timeRemaining = 10
    var timer = Timer()
    
    
    // MARK: Update UI
    
    func updateTime() {
        let (minutes, seconds) = minutesAndSeconds(from: timeRemaining)
        let min = formatNumber(minutes)
        let sec = formatNumber(seconds)
        timerLabel.text = "\(min) : \(sec)"
    }
    
    
    var score = 0
    //Set up properties of the scoreLabel
    var scoreLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.numberOfLines = 2
        label.text = "Score:0"
        label.color = .white
        label.fontName = "GillSans-SemiBold"
        label.fontSize = 40
        
        return label
    }()
    
    
    //Set up properties of the timerLabel
    var timerLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.numberOfLines = 1
        label.text = "0:10"
        label.color = .white
        label.fontName = "GillSans-SemiBold"
        label.fontSize = 40
        
        return label
    }()
    
    
    var health = 10
    var monster = SKSpriteNode()
    var monsterHealth = SKShapeNode()
    
    
    override func didMove(to view: SKView) {
        labelSetUp()
        scheduledTimerWithTimeInterval()
        self.backgroundColor = .black
        self.monsterSetup()
        self.monsterHealthSetup()
    }
    
    
    func monsterSetup(){
        monster.texture = SKTexture(image: #imageLiteral(resourceName: "ghost"))
        monster.position.x = view!.bounds.width / 2
        monster.position.y = view!.bounds.height - 300
        monster.zPosition = 1
        monster.size = CGSize(width: 200, height: 200)
        addChild(monster)
    }
    
    
    func monsterHealthSetup(){
        let healthFrame = CGRect(x: view!.bounds.width / 10, y: 480, width: 300, height: 30)
        monsterHealth = SKShapeNode(rect: healthFrame, cornerRadius: 15)
        monsterHealth.fillColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addChild(monsterHealth)
    }
    
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
        self.updateTimer()
      })
    }
    
    
    func updateTimer(){
        if timeRemaining > 0 {
            print(timeRemaining)
            timeRemaining -= 1
            self.updateTime()
        }
    }
    
    
    func labelSetUp() {
        scoreLabel.position.x = view!.bounds.width / 2
        scoreLabel.position.y = view!.bounds.height - 50
        scoreLabel.zPosition = 1
        addChild(scoreLabel)
        
        timerLabel.position.x = view!.bounds.width / 2
        timerLabel.position.y = view!.bounds.height - 100
        timerLabel.zPosition = 1
        addChild(timerLabel)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        score += 1
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    // MARK: Formatters
    
    // Input: number of seconds, returns it as (minutes, seconds).
    func minutesAndSeconds(from seconds: Int) -> (Int, Int) {
        return (seconds / 60, seconds % 60)
    }

    // Input: number, returns a string of 2 digits with leading zero if needed
    func formatNumber(_ number: Int) -> String {
        return String(format: "%02d", number)
    }
    
}

