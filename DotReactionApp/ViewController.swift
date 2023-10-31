//
//  ViewController.swift
//  DotReactionApp
//
//  Created by Caleb Bernholtz on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var arrowShown: UIImageView!
    
    @IBOutlet var runningDots2: [UIImageView]!
    
    @IBOutlet weak var clickTapped: UIButton!
    
    @IBOutlet weak var pixelArtView: UIImageView!
    
    //var winningDot = [1]
    var timer = Timer()
    var timer2 = Timer()
    var counter = 31
    var loopStep = 0
    var timerSpeed = 0.1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pixelArtView.image = UIImage.gifImageWithName("pixelArt")
        loop()
        musicPlaySound(whatSound: "gameMusic")
    }
    
    @IBAction func clickTapped(_ sender: UIButton) {
        loop2()
    }
    func loop(){
                timer = Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(invisibleDots), userInfo: nil, repeats: true)
    }
    
    
    @ objc func invisibleDots(){
        loopStep += 1
        if loopStep <= 31{
            runningDots2[loopStep].isHidden = true
        }else{
            timer.invalidate()
        }
    }
    
    func loop2(){
        clickTapped.isHidden = true
        loopStep = 1
        timer2 = Timer.scheduledTimer(timeInterval: timerSpeed, target: self, selector: #selector(invisibleDots2), userInfo: nil, repeats: true)
    }
    
    
    @ objc func invisibleDots2(){
        loopStep += 1
        //print(loopStep)
        //runningDots2[loopStep].isHidden = false
        let previousStep = loopStep - 1
        if loopStep <= 31{
            runningDots2[loopStep].isHidden = false
            runningDots2[previousStep].isHidden = true
        }else{
            loopStep = 1
            runningDots2[31].isHidden = true
        }
        
    }
    

    
    @IBAction func stopTapped(_ sender: UIButton) {
        musicPlayer.stop()
        timer2.invalidate()
        print(loopStep)
        if loopStep == 1{
            print("won")
            clickTapped.isHidden = false
            performSegue(withIdentifier: "goWin", sender: nil)
            timerSpeed -= 0.01
            musicPlaySound(whatSound: "winSound")
        }else{
            performSegue(withIdentifier: "goLose", sender: nil)
            musicPlaySound(whatSound: "loseSound")
            }
        }
    }

