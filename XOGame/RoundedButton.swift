//
//  RoundedButton.swift
//  sales tracker
//
//  Created by Mahmoud El-Melligy on 12/18/18.
//  Copyright © 2018 Mahmoud El-Melligy. All rights reserved.
//

import UIKit
class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        //making button corner button
        layer.cornerRadius = 20
        clipsToBounds = true
    }

}

