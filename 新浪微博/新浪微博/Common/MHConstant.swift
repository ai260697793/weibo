//
//  MHConstant.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/6.
//  Copyright © 2016年 MH. All rights reserved.
//

import Foundation

func printLog<T>(message: T,
              logError: Bool = false,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    if logError {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    } else {
        #if DEBUG
            print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        #endif
    }
}

// MARK: - 微博注册信息
let AppKey = "2990485310"
let AppSecret = "c0e78554e15a9f441a9f59dac7d6a772"
let AppRedictUrl = "http://www.baidu.com"

// MARK: - 通知名称
let kNotificationChangeViewController = "kNotificationChangeViewController"

