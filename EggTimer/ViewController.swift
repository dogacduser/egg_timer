//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    

    @IBAction func hardnessAction(_ sender: UIButton ) {
        
//        print(sender.currentTitle)
        
        let hardness = sender.currentTitle
        
        if sender.currentTitle == "Hard" {
            print(12)
        }
        else if sender.currentTitle == "Medium" {
            print(7)
        }
        else if sender.currentTitle == "Soft" {
            print(5)
            
        }
        
        
    }
    
    
}
