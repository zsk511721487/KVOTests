//
//  ViewController.swift
//  TestKVO
//
//  Created by 张少康 on 15/12/7.
//  Copyright © 2015年 GYZH. All rights reserved.
//

import UIKit

private var myContext = 0
class ViewController: UIViewController {

    var myObject: MyClass!
    @IBOutlet weak var label: UILabel!
    var pacmanOpenPath: UIBezierPath?
    var pacmanClosePath: UIBezierPath?
    var shapeLayer: CAShapeLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.masksToBounds = true
        self.view.layer.backgroundColor = UIColor.orangeColor().CGColor
        self.view.layer.cornerRadius = 20
        myObject = MyClass.shareManager
        self.label.text = "初始化myClass，当前年龄：\(myObject.age)"
        myObject.addObserver(self, forKeyPath: "age", options: .New, context: &myContext)
        initAnimation()
        
        let temp =  "adsfadfadfasdgahg"
        
        for i in temp.characters {
            print(i)
        }
        
//        let time: NSTimeInterval = 2.0
//        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
//        dispatch_after(delay, dispatch_get_main_queue()) {
//            self.myObject.date = NSDate()
//            self.myObject.age = 20
//        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func initAnimation(){
        
        let radius: CGFloat = 40
        let diameter: CGFloat = radius * 2
        let arcCenter = CGPointMake(radius, radius)
        
        self.pacmanOpenPath =  UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle:getRadius(35), endAngle: getRadius(315), clockwise: true)

//        self.pacmanOpenPath?.lineWidth = 2
        self.pacmanOpenPath?.addLineToPoint(arcCenter)
        self.pacmanOpenPath?.closePath()
        
        self.pacmanClosePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: getRadius(1), endAngle: getRadius(359), clockwise: true)
        self.pacmanClosePath?.addLineToPoint(arcCenter)
        self.pacmanClosePath?.closePath()
        

        shapeLayer = CAShapeLayer()
        shapeLayer!.fillColor = UIColor.clearColor().CGColor
        shapeLayer!.path = self.pacmanOpenPath?.CGPath
        shapeLayer!.strokeColor = UIColor.grayColor().CGColor
        shapeLayer!.lineWidth = 1.0
        shapeLayer!.bounds = CGRectMake(0, 0, diameter, diameter)
        shapeLayer!.position = CGPointMake(100, 100)
        self.view.layer.addSublayer(shapeLayer!)
        
        let startSelector = Selector("startAnimation")
        let recognizer = UITapGestureRecognizer(target: self, action: startSelector)
        self.view.addGestureRecognizer(recognizer)
        
    }
    func startAnimation(){
        
        let chomAnimation = CABasicAnimation(keyPath: "path")
        chomAnimation.duration = 0.25
        chomAnimation.timingFunction =  CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        chomAnimation.repeatCount = HUGE
        chomAnimation.autoreverses = true
        chomAnimation.fromValue = pacmanClosePath?.CGPath
        chomAnimation.toValue = pacmanOpenPath?.CGPath
        shapeLayer?.addAnimation(chomAnimation, forKey: "chomAnimation")
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, 100))
        path.addLineToPoint(CGPointMake(300, 100))
        path.addLineToPoint(CGPointMake(300, 200))
        path.addLineToPoint(CGPointMake(0, 200))
        path.addLineToPoint(CGPointMake(0, 300))
        path.addLineToPoint(CGPointMake(300, 400))
        
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        moveAnimation.path = path.CGPath
        moveAnimation.duration = 8.0
        moveAnimation.rotationMode = kCAAnimationRotateAuto
        shapeLayer?.addAnimation(moveAnimation, forKey: "moveAnimation")
    }
    
    
    func getRadius(x: CGFloat)-> CGFloat{
        return (3.14159265358979323846*x/180.0)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &myContext {
             self.label.text = "初始化myClass，当前年龄：\(change![NSKeyValueChangeNewKey]!)"
        }
    }
    
    
    @IBAction func plusButton(sender: UIButton) {
        self.performSegueWithIdentifier("shouDetailse", sender: self)
    }
    @IBAction func subtractButtonClick(sender: UIButton) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shouDetailse" {
            let vc = segue.destinationViewController as! SecondViewController
            vc.initClosure(myObject, myClosure: { () -> Void in
                
                
            })        }
    }

}

