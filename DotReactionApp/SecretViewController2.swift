//
//  SecretViewController2.swift
//  DotReactionApp
//
//  Created by Caleb Eric Bernholtz on 10/25/23.
//

import UIKit

class SecretViewController2: UIViewController {
    
    @IBOutlet var runningDots: [UIImageView]!
    
    @IBOutlet weak var rainbowArtView: UIImageView!
    
    @IBOutlet weak var clickTapped: UIButton!
    
    var timer = Timer()
    var timer2 = Timer()
    var counter = 0
    var loopStep = 0
    var timerSpeed = 0.08
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicPlaySound(whatSound: "secretMusic")
        rainbowArtView.image = UIImage.gifImageWithName("rainbowArt")
    }
    
    @ objc func invisibleDots2(){
        loopStep += 1
        let previousStep = loopStep - 1
        if loopStep <= 32{
            runningDots[loopStep].isHidden = false
            runningDots[previousStep].isHidden = true
        }else{
            loopStep = 1
            runningDots[32].isHidden = true
        }
    }
    
    @IBAction func clickTapped(_ sender: UIButton) {
        loops2()
    }
    func loops(){
        timer = Timer(timeInterval: 0.0, target: self, selector: #selector(invisibleDots), userInfo: nil, repeats: true)
    }
    
    @ objc func invisibleDots(){
        loopStep += 1
        if loopStep <= 32{
            runningDots[loopStep].isHidden = true
        }else{
            timer.invalidate()
        }
    }
    
    func loops2(){
        clickTapped.isHidden = true
        loopStep = 1
        timer2 = Timer.scheduledTimer(timeInterval: timerSpeed, target: self, selector: #selector(invisibleDots2), userInfo: nil, repeats: true)
    }
    
    
    
    @IBAction func stopTapped(_ sender: UIButton) {
        timer2.invalidate()
        if loopStep == 32{
            clickTapped.isHidden = false
            performSegue(withIdentifier: "goWinner", sender: nil)
            musicPlaySound(whatSound: "winSound")
        }else{
            performSegue(withIdentifier: "goLoser", sender: nil)
            musicPlaySound(whatSound: "loseSound")
        }
        
        
    }
    
    
}

