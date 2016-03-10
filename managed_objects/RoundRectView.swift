//
//  RoundRectView.swift
//  MysticEvents
//
//  Created by Erik Walter on 3/10/16.
//  Copyright © 2016 Erik Walter. All rights reserved.
//

import UIKit

class RoundRectView: UIView {

    var color: UIColor?
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
//        UIColor.orangeColor().setFill()
//        UIRectFill(rect)

        let context = UIGraphicsGetCurrentContext()
        let insetRect = CGRectInset(rect, 2, 2)
        let bezierPath = UIBezierPath(roundedRect: insetRect, cornerRadius: 20)

        if let color = color {
            CGContextSetFillColorWithColor(context, color.CGColor)
        } else {
            let blueish = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.7)
            CGContextSetFillColorWithColor(context, blueish.CGColor)
        }
        bezierPath.fill()
        
    }

}
