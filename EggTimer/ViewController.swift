//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //test timer code
    let eggTime : [String : Int] = ["Soft": 3,
                                    "Medium" : 4,
                                    "Hard" : 7]
//Production timer code
//    let eggTime : [String : Int] = ["Soft": 300,
//                                      "Medium" : 420,
//                                      "Hard" : 720]
    
    var timer = Timer() //create a variable for the timer instance so we can invalidate it later to stop multiple instances starting each time you press the button.
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer! //AUDIO PLAYER
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timeLeft: UILabel!
    
    @IBOutlet weak var stopTimerButton: UIButton!
    
    @IBAction func stopTimer(_ sender: Any) {
        stopSound() //kills sounds
        stopTimerButton.isHidden = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set button2 hidden at start
        timeLeft.isHidden = true
        progressBar.setProgress(0, animated: false) //set progress back to zero
        titleLabel.font = .boldSystemFont(ofSize: 30)
        stopTimerButton.isHidden = true
    }
   
    
    @IBAction func hardnessAction(_ sender: UIButton ) {
        
       
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
            
//      timeLeft.text = String((totalTime) - (secondsPassed))
            
//UPDATE UI LAbel with minutes and seconds!!!
        let i = ((totalTime) - (secondsPassed))
        timeLeft.text = String(timeString(time: TimeInterval(i))) //isnt upda
            
        }
        else {
            timer.invalidate()

//PLAY SOUND
            titleLabel.font = .boldSystemFont(ofSize: 30)
            titleLabel.text = String("Done!")
            playSound(soundName: "alarm_sound")
            stopTimerButton.isHidden = false
            
//PLAY SOUND
            
            
            
//ANIMATE DONE BUTTON
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.5, animations: {
                self.titleLabel.alpha = 0
            }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                    self.titleLabel.alpha = 1
                }) { _ in
                    UIView.animate(withDuration: 0.5, animations: {
            self.titleLabel.alpha = 0
            }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.titleLabel.alpha = 1
            }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.titleLabel.alpha = 0
            }) { _ in
           UIView.animate(withDuration: 0.5, animations: {
                   self.titleLabel.alpha = 1
            }) { _ in }}}}}}
                    }
            //add a delay before resseting
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                self.progressBar.setProgress(0, animated: true) //set progress back to zero
                self.secondsPassed = 0
                self.titleLabel.text = "How do you like your eggs?"
                self.timeLeft.isHidden = true
            }

        }
    }
    
    
        func playSound(soundName: String) {
                   let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
                self.player.numberOfLoops = -1

               }
    
        func stopSound() {
                player.stop()
        }

        
//FUNCTION to translate seconds into minutes!!!

        func timeString(time: TimeInterval) -> String {
//            let hour = Int(time) / 3600
            let minute = Int(time) / 60 % 60
            let second = Int(time) % 60

            // return formated string
            return String(format: "%02i:%02i", minute, second)
        }
    
    }


//Attempted to use clas extension for flashing done label!





                
//                self.yourLabel.alpha = 1;
//                [UIView animateWithDuration:1.5 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
//                        self.yourLabel.alpha = 0;
//                } completion:nil];
                
//                let duration = self.transitionDuration(using: transitionContext)

//                let firstAnimDuration = 0.5
//                UIView.animate(withDuration: 0.5) {
//                    self.titleLabel.alpha = 0
//                } { (completed) in
//
//                   UIView.animate(withDuration: 0.5) {
//                       self.titleLabel.alpha = 1
//                   })
//                }


//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    UIView.animate(withDuration: 0.5) {
//                                         self.titleLabel.alpha = 0
//                                   }
//                }
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    UIView.animate(withDuration: 0.5) {
//                                        self.titleLabel.alpha = 1
//                                    }
//                    }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                          UIView.animate(withDuration: 0.5) {
//                                               self.titleLabel.alpha = 0
//                                         }
//                      }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                          UIView.animate(withDuration: 0.5) {
//                                              self.titleLabel.alpha = 1
//                                          }
                
       
       
//                UIView.animate(withDuration: 0.5) {
//                              self.titleLabel.alpha = 0
//                        }
//                UIView.animate(withDuration: 0.5) {
//                              self.titleLabel.alpha = 1
//                        }

//extension UILabel {
//
//    func startBlink() {
//        UIView.animate(withDuration: 0.8,
//              delay:0.0,
//              options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
//              animations: { self.alpha = 0 },
//              completion: nil)
//    }
//
//    func stopBlink() {
//        layer.removeAllAnimations()
//        alpha = 1
//    }
//}

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
