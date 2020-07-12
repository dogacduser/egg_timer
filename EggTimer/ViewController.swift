//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime : [String : Int] = ["Soft": 5,
                                    "Medium" : 7,
                                    "Hard" : 12]
    
    
    @IBAction func hardnessAction(_ sender: UIButton ) {
        
//        print(sender.currentTitle)
        //current title is an optional because sting could be empty
        
        let hardness = sender.currentTitle! //soft, medium., hard
        
        let result  = eggTime[hardness]! //force unwrap as we're confident of the spelling
        
        print(result)
        
        
        

        }
        
    }
 






///

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
