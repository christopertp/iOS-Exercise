//
//  UIColor.swift
//  Recorder
//
//  Created by Christoper on 21/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let seemuBlue = UIColor(hex: 0x00adf7)
    static let youtubeRed = UIColor(hex: 0xf80000)
    static let transparentBlack = UIColor(hex: 0x000000, a: 0.5)
    static let customRed = UIColor(hex: 0xff0000)
    static let customRed2 = UIColor(red: 255, green: 0, blue: 0)
    
    static let purpleHeart = UIColor(hex: 0x742FE5)
    static let vermilion = UIColor(hex: 0xFA4708)
    static let corn = UIColor(hex: 0xDEB507)
    static let harlequin = UIColor(hex: 0x26F514)
    static let cerulean = UIColor(hex: 0x07B5DE)
    
    convenience init(red:Int, green:Int, blue:Int, a:CGFloat = 1.0) {
        self.init(red:CGFloat(red) / 255.0,
                  green:CGFloat(green) / 255.0,
                  blue:CGFloat(blue) / 255.0,
                  alpha:a
        )
    }
    
    convenience init(hex:Int, a:CGFloat = 1.0) {
        self.init(
            red:(hex >> 16) & 0xFF,
            green:(hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a:a)
    }
    
    //    class var lightBlue: UIColor{
    //        return #colorLiteral(red: 0, green: 0.9791885018, blue: 0.9696876407, alpha: 1)
    //    }
    //
    //    class var random: UIColor{
    //        let r = CGFloat.random(in: 0...1)
    //        let g = CGFloat.random(in: 0...1)
    //        let b = CGFloat.random(in: 0...1)
    //
    //        return UIColor(red: r, green: g, blue: b, alpha: 1)
    //    }
}
