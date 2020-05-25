//
//  UIButton.swift
//  Recorder
//
//  Created by Christoper on 21/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import UIKit

extension RoundedUIButon {
    func shadow () {
        self.layer.shadowColor = UIColor.transparentBlack.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    func rounded () {
        self.layer.cornerRadius = self.frame.height/2
    }
    
    func bgNormal () {
        self.backgroundColor = .corn
    }
    
    func bgActive () {
        self.backgroundColor = .vermilion
    }
    
    func bgRed () {
        self.backgroundColor = .youtubeRed
    }
    
    func disabledBtn () {
        self.isEnabled = false
        self.backgroundColor = .transparentBlack
    }
    
    func enabledBtn () {
        self.isEnabled = true
        self.backgroundColor = .white
    }
}
