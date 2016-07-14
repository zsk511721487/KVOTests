//
//  ItemsOneViewController.swift
//  TestKVO
//
//  Created by 张少康 on 15/12/11.
//  Copyright © 2015年 GYZH. All rights reserved.
//

import UIKit

let PROGREESS_WIDTH:CGFloat = 80
let PROGRESS_LINE_WIDTH: CGFloat = 4
class ItemsOneViewController: UIViewController {

    var trackLayer: CAShapeLayer?
    let cutomClass = MyClass.shareManager
    override func viewDidLoad() {
        super.viewDidLoad()
        initShapeLayer()
        // Do any additional setup after loading the view.
    }

    func initShapeLayer(){
        trackLayer = CAShapeLayer()
        trackLayer?.frame = CGRectMake(100, 100, 200, 200)
        
        trackLayer?.fillColor = UIColor.clearColor().CGColor
        trackLayer?.strokeColor = UIColor.grayColor().CGColor
        trackLayer?.lineCap = kCALineCapRound
        trackLayer?.opacity = 0.25
        trackLayer?.lineWidth = PROGRESS_LINE_WIDTH
        
        UIView.animateWithDuration(2) { () -> Void in
            let path = UIBezierPath(arcCenter: CGPointMake(40, 40), radius: (PROGREESS_WIDTH - PROGRESS_LINE_WIDTH)/2, startAngle: self.getRadius(-30), endAngle: self.getRadius(210), clockwise: true)
            self.trackLayer?.path = path.CGPath
            self.view.layer.addSublayer(self.trackLayer!)
        }
        
        
        
    }
    
    
    func getRadius(x: CGFloat)-> CGFloat{
        return (3.14159265358979323846*x/180.0)
    }
    @IBAction func choseItemsLabelNumber(sender: UIButton) {
        self.cutomClass.age += 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
