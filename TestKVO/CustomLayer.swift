//
//  CustomLayer.swift
//  TestKVO
//
//  Created by 张少康 on 15/12/14.
//  Copyright © 2015年 GYZH. All rights reserved.
//

import UIKit

class CustomLayer: CALayer {

    var progress: CGFloat?
    var lineWidth: CGFloat?
    var color: UIColor?
    
    override func needsDisplay() -> Bool {
        return super.needsDisplay()
    }
    
    override func drawInContext(ctx: CGContext) {
         let path = UIBezierPath()
        let radius = min(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))/2 - 6/2
        let center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        
        let origiStart: CGFloat = CGFloat(M_PI * 7 / 2)
        let originEnd: CGFloat = CGFloat(M_PI * 2)
        let currentOrigin = origiStart - (origiStart - originEnd) * self.progress!
        
        let destStart: CGFloat = CGFloat(M_PI * 3)
        let destEnd: CGFloat = 0
        let currentDest = destStart - (destStart - destEnd) * self.progress!
        
        path.addArcWithCenter(center, radius: radius, startAngle: currentOrigin, endAngle: currentDest, clockwise: false)
        CGContextAddPath(ctx, path.CGPath)
        CGContextSetLineWidth(ctx, self.lineWidth!)
        CGContextSetStrokeColorWithColor(ctx, self.color!.CGColor)
        CGContextStrokePath(ctx)
        
    }
}
