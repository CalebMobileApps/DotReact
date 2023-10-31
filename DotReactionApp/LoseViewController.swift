//
//  LoseViewController.swift
//  DotReactionApp
//
//  Created by Caleb Eric Bernholtz on 10/24/23.
//

import UIKit

class LoseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //createParticles()
    }
    override func viewDidAppear(_ animated: Bool) {
            createParticles()
        }
        
        func createParticles(){
            let particleEmitter = CAEmitterLayer()
            particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
            particleEmitter.emitterShape = .line
            particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
            let white = makeEmitterCell(color: UIColor.white)
            particleEmitter.emitterCells = [white]
            view.layer.addSublayer(particleEmitter)
        }
        
        func makeEmitterCell(color: UIColor) -> CAEmitterCell{
            let cell = CAEmitterCell()
            cell.birthRate = 8 // Increase the birth rate for more particles
            cell.lifetime = 4 // Decrease the particle lifetime
            cell.lifetimeRange = 0.3 // Add some variation to lifetime
            cell.color = color.cgColor
            cell.velocity = 250 // Increase initial velocity
            cell.velocityRange = 75 // Add some variation to velocity
            cell.emissionLongitude = CGFloat.pi
            cell.emissionRange = CGFloat.pi / 8
            cell.spin = 1 // Decrease spin speed
            cell.spinRange = 1 // Add some variation to spin
            cell.scale = 0.005 // Increase the initial scale
            cell.scaleRange = 0.005 // Reduce the scale variation
            cell.scaleSpeed = -0.03 // Decrease the scale change over time
            cell.contents = UIImage(named: "redDot")?.cgImage
            return cell
        }
    
}
