//
//  ViewController.swift
//  Dicee1
//
//  Created by Adam Khalifa on 4/23/20.
//  Copyright © 2020 Adam Khalifa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    //let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
      randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        print(randomDiceIndex1)
        
    }
    
}

