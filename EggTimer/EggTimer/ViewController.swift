//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
// Updated by Griffin Heinberg on 03/06/2025
// Enhancements:
// 1) Added "Scrambeled" - 10 second timer with picture
// 2) Choose scrambled eggs! switch / case

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Variables used within IBoutlet, #1 enhancement "Scrambeled" : 10 with picture
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7, "Scrambled": 10]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //Timer
        timer.invalidate()
        let hardness = sender.currentTitle! //Soft, medium, hard
        
        //Hardness of eggs , "!" validates
        totalTime = eggTimes[hardness]!
        
        //Progress
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        //Timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    // Update timer
    @objc func updateTimer() {
        
        //if this happens
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
                        
            //Else
            } else {
                timer.invalidate()
                //titleLabel.text = "Done!"
                
                // #2 enhancement - pursuade user to choose scrambled eggs!
                switch eggTimes[titleLabel.text!]
                
                {
                 case 3:
                    titleLabel.text = "Why didn't you choose scrambled? 🥚"
                    break
                case 4:
                    titleLabel.text = "Are you sure you don't want scrambled? 🥚"
                    break
                case 7:
                    titleLabel.text = "You're not getting any younger! 🥚"
                    break
                case 10:
                    titleLabel.text = "Yay scrambled! 🥚"
                    break
                default:
                    titleLabel.text = "Done! 🥚"
                    
                }
                
                
        }
    }
}
