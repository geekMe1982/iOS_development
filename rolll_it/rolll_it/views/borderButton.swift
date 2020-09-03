//
//  borderButton.swift
//  rolll_it
//
//  Created by Adam Khalifa on 01/09/2020.
//  Copyright © 2020 Adam Khalifa. All rights reserved.
//

import UIKit

class borderButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
