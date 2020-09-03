//
//  ViewController.swift
//  rolll_it
//
//  Created by Adam Khalifa on 01/09/2020.
//  Copyright © 2020 Adam Khalifa. All rights reserved.
//

import UIKit

var array = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

var randomImgIndex1 = 0
var randomImgIndex2 = 0


class ViewController: UIViewController {
    @IBOutlet weak var diceImgRight: UIImageView!
    @IBOutlet weak var diceImgLeft: UIImageView!
    
    @IBAction func rollPress(_ sender: UIButton)
    {
        
        updateImageView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    
    func updateImageView()
    {
        randomImgIndex1 = Int.random(in: 0...5)
        randomImgIndex2 = Int.random(in: 0...5)
        
        diceImgLeft.image = UIImage(named: array[randomImgIndex1])
        diceImgRight.image = UIImage(named: array[randomImgIndex2])
        

    }


}

