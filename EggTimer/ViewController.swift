//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController {
    
    let eggTime : [String : Int] = ["Soft": 3,
                                    "Medium" : 4,
                                    "Hard" : 7]
    
    var timer = Timer() //create a variable for the timer instance so we can invalidate it later to stop multiple instances starting each time you press the button.
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer! //AUDIO PLAYER
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timeLeft: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set button2 hidden at start
        timeLeft.isHidden = true
        progressBar.setProgress(0, animated: false) //set progress back to zero
        titleLabel.font = .boldSystemFont(ofSize: 30)
    }

 
    
                func animateStretch(label: SKLabelNode) {
                    
                    let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
                    let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
                    let pause = SKAction.removeFromParent()                 //pause sequence add to array
                    let sequence = SKAction.sequence([scaleUp, scaleDown, pause])
                    label.run(SKAction.repeat(sequence, count: 2))
                }
    
    
    @IBAction func hardnessAction(_ sender: UIButton ) {
        
        // titleLabel.text = String("How do you like your eggs?")
        //print(sender.currentTitle)
        //current title is an optional because sting could be empty
        
    timer.invalidate() //invalidate timer before it starts a new one on pressing button
    let hardness = sender.currentTitle! //soft, medium., hard
    totalTime  = eggTime[hardness]! //force unwrap as we're confident of the spelling set total time to egg
        
    progressBar.setProgress(0, animated: true) //set progress back to zero
    secondsPassed = 0
    titleLabel.text = hardness //set hardness to egg
 
        

    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    

        @objc func updateCounter() {
            if secondsPassed < totalTime {
            
            secondsPassed += 1
                
            progressBar.setProgress(Float(secondsPassed) / Float(totalTime), animated: true)
                      
            print(Float(secondsPassed) / Float(totalTime))
            timeLeft.isHidden = false
            timeLeft.text = String((totalTime) - (secondsPassed))
                
            }
//            else if secondsRemaining == 0{
//            }
            else {
                timer.invalidate()
                
                titleLabel.font = .boldSystemFont(ofSize: 30)
                titleLabel.text = String("Done!")
                
                
                
                playSound(soundName: "alarm_sound")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.progressBar.setProgress(0, animated: true) //set progress back to zero
                    self.secondsPassed = 0
                    self.titleLabel.text = "How do you like your eggs?"
                    self.timeLeft.isHidden = true
                }
            }
        }
    
        func playSound(soundName: String) {
               let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
               player = try! AVAudioPlayer(contentsOf: url!)
               player.play()

           }
    

}


////TIMER - SHORTER CODE
//
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
//            if self.secondsRemaining > 0 {
//                print ("\(self.secondsRemaining) seconds")
//                self.secondsRemaining -= 1
//            } else {
//                Timer.invalidate()
//            }
//        }
//
//    }
//}

//SWITCH STATEMENT
//
//let hardness = sender.currentTitle
//
//switch hardness {
//case "Hard":
//    print(hardTime)
//
//case "Medium":
//    print(mediumTime)
//
//case "Soft":
//    print(softTime)
//
//default:
//    print("Error")
//}
