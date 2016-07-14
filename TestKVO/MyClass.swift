//
//  MyClass.swift
//  TestKVO
//
//  Created by 张少康 on 15/12/7.
//  Copyright © 2015年 GYZH. All rights reserved.
//

import UIKit

let shareInstance = MyClass()
class MyClass: NSObject {
    dynamic var date = NSDate()
    dynamic var age = 0
    
    class var shareManager : MyClass {
        return shareInstance
    }
    
}
