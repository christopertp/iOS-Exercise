//
//  RoundedUIButton.swift
//  Recorder
//
//  Created by Christoper on 21/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import UIKit

class RoundedUIButon: UIButton {
    override func didMoveToWindow(){
        self.layer.cornerRadius = self.frame.height/2
    }
}
