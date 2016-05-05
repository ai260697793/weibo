//
//  MHHTTPClient.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import AFNetworking

/// 抽取网络工具类
class MHHTTPClient: AFHTTPSessionManager {
    
    // 实现单例
    static let sharedInstance: MHHTTPClient = {
        let client = MHHTTPClient()
        client.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return client
    }()

}
