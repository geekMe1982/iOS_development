//
//  ViewController.swift
//  magic8ball
//
//  Created by Adam Khalifa on 12/10/19.
//  Copyright © 2019 Adam Khalifa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5","ball6"]
    
    var randomBallNumber = 0

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImageView()
//        randomBallNumber = Int.random(in: 0 ... 4)
//
//        imageView.image = UIImage(named: ballArray[randomBallNumber])
        
//     imageView.image = UIImage(named: "start")
       
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeImageView()
    }
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        changeImageView()
//        randomBallNumber = Int.random(in: 0 ... 4)
//
//        imageView.image = UIImage(named: ballArray[randomBallNumber])
        
       print(randomBallNumber)
        
    }
        
        
        func changeImageView(){

            randomBallNumber = Int.random(in: 0 ... 4)

            imageView.image = UIImage(named: ballArray[randomBallNumber])

        }
    }

