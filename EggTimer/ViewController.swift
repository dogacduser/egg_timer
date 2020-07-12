//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime : [String : Int] = ["Soft": 3,
                                    "Medium" : 4,
                                    "Hard" : 7]
    // timer start point
    var secondsRemaining = 60
    var timer = Timer() //create a variable for the timer instance so we can invalidate it later to stop multiple instances starting each time you press the button.
    
    @IBOutlet weak var titleLabel: UILabel!
   
    
    @IBAction func hardnessAction(_ sender: UIButton ) {
        
// titleLabel.text = String("How do you like your eggs?")
//print(sender.currentTitle)
//current title is an optional because sting could be empty
        
    timer.invalidate() //invalidate timer before it starts a new one on pressing button
    let hardness = sender.currentTitle! //soft, medium., hard
    secondsRemaining  = eggTime[hardness]! //force unwrap as we're confident of the spelling

    
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    

        @objc func updateCounter() {
            if secondsRemaining > 0 {
                print("\(secondsRemaining) seconds")
                secondsRemaining -= 1
            }
            else if secondsRemaining == 0{
                    titleLabel.text = String("Done")
            }
            else {
                timer.invalidate()
            }
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
