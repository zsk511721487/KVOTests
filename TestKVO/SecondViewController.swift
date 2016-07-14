//
//  SecondViewC/Users/zhangshaokang/Desktop/landlord_ios/Baye/Baye.xcodeprojontroller.swift
//  TestKVO
//
//  Created by 张少康 on 15/12/7.
//  Copyright © 2015年 GYZH. All rights reserved.
//

import UIKit

typealias custonClosure = ()->Void
class SecondViewController: UIViewController {

    var sunLeiClass: MyClass?
    var refreshClosure: custonClosure?
    func initClosure(myClassModel: MyClass ,myClosure: custonClosure){
        sunLeiClass = myClassModel
        refreshClosure = myClosure
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonlick(sender: UIButton) {
        sunLeiClass?.age += 10
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
