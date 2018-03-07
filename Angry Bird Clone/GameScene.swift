//
//  GameScene.swift
//  Angry Bird Clone
//
//  Created by inan on 7.03.2018.
//  Copyright © 2018 inan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
      var timer = Timer()
//    var bird2 = SKSpriteNode()
      var bird = SKSpriteNode()
      var box = SKSpriteNode()
      var box1 = SKSpriteNode()
      var box2 = SKSpriteNode()
      var box3 = SKSpriteNode()
      var box4 = SKSpriteNode()
      var gameStarted = false
      var birdOriginalPosition : CGPoint!
      var boxOriginalPosition : CGPoint!
      var box1OriginalPosition : CGPoint!
      var box2OriginalPosition : CGPoint!
      var box3OriginalPosition : CGPoint!
      var box4OriginalPosition : CGPoint!
      var score = 0
      var scoreLabel = SKLabelNode()
    
    enum ColliderType : UInt32{
        case Bird = 1
        case Box = 2
    }
    
    
    override func didMove(to view: SKView) {
       
        
        //delagete
        physicsWorld.contactDelegate = self
        
        
       physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
       //bird
        let birdTexture = SKTexture(imageNamed: "bird.png")
        bird = childNode(withName: "bird") as! SKSpriteNode
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 11 )
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.1
        bird.physicsBody?.affectedByGravity = false
        birdOriginalPosition = bird.position
        bird.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
        
        // box
        let boxtexture = SKTexture(imageNamed: "box.png")
        let size = CGSize(width: boxtexture.size().width / 5, height: boxtexture.size().height / 5)
        box = childNode(withName: "box") as! SKSpriteNode
        box.physicsBody = SKPhysicsBody(rectangleOf: size)
        box.physicsBody?.isDynamic = true
        box.physicsBody?.affectedByGravity = true
        boxOriginalPosition = box.position
        box.physicsBody?.allowsRotation = true
        box.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1OriginalPosition = box1.position
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2OriginalPosition = box2.position
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3OriginalPosition = box3.position
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4OriginalPosition = box4.position
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

        //score
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 3
        self.addChild(scoreLabel)
        
        
        
//        
//        let texture2 = SKTexture(imageNamed: "bird.png")
//        bird2 = SKSpriteNode(texture: texture2)
//        bird2.position = CGPoint(x: 0, y: 0)
//        bird2.size = CGSize(width: self.frame.width / 13, height: self.frame.height / 10)
//        bird2.zPosition = 2
//        self.addChild(bird2)
       
    }
    

    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyB.collisionBitMask  == ColliderType.Bird.rawValue || contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue {
            
            score = score + 1
            scoreLabel.text = String(score)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                
                                let dx = (touchLocation.x - birdOriginalPosition.x)
                                let dy = (touchLocation.y - birdOriginalPosition.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                                
                                
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    @objc func beginPosition(){
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        bird.physicsBody?.angularVelocity = 0
        bird.zRotation = 0
        bird.position = birdOriginalPosition
        
        box.position = boxOriginalPosition
        box1.position = box1OriginalPosition
        box2.position = box2OriginalPosition
        box3.position = box3OriginalPosition
        box4.position = box4OriginalPosition
        
        score = 0
        scoreLabel.text = String(score)
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if let birdPhysicsBody = bird.physicsBody {
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                gameStarted = false
                timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameScene.beginPosition), userInfo: nil, repeats: false)
                
                
            }
        }
    
    }
}
