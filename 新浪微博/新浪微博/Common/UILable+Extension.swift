//
//  UILable+Extension.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/10.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit


extension UILabel {

    // 便利构造函数
    convenience init(size: CGFloat, color: UIColor, isSingleLine: Bool) {
        self.init()
        self.font = UIFont.systemFontOfSize(size)
        self.textColor = color
        if isSingleLine {
            self.numberOfLines = 1
        }else {
            self.numberOfLines = 0
        }
    }
}
