//
//  Const.swift
//  LiveAssiant
//
//  Created by 于传峰 on 2017/9/4.
//  Copyright © 2017年 tv.yuzijiang. All rights reserved.
//

import UIKit

func YZJRandomColor() -> UIColor {
    let red = CGFloat(arc4random()%256)/255.0
    let green = CGFloat(arc4random()%256)/255.0
    let blue = CGFloat(arc4random()%256)/255.0
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}




