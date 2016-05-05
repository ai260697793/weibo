//
//  MHHTTPClient.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import AFNetworking

enum MHHTTPClientType: String {
    case POST = "POST"
    case GET = "GET"
}

/// 抽取网络工具类
class MHHTTPClient: AFHTTPSessionManager {
    
    // 实现单例
    static let sharedInstance: MHHTTPClient = {
        let client = MHHTTPClient()
        client.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return client
    }()
    
    // 方法重载抽取代码
    func request(type: MHHTTPClientType ,URLString: String, parameters: AnyObject?, success: ((NSURLSessionDataTask, AnyObject?) -> Void)?, failure: ((NSURLSessionDataTask?, NSError) -> Void)?) {
        
        request(type, URLString: URLString, parameters: parameters, progress: nil, success: success, failure: failure)
    }
    
    // 网络工具类里创建网络请求
    func request(type: MHHTTPClientType ,URLString: String, parameters: AnyObject?, progress: ((NSProgress) -> Void)?, success: ((NSURLSessionDataTask, AnyObject?) -> Void)?, failure: ((NSURLSessionDataTask?, NSError) -> Void)?) {
        if type == .GET {
            //GET
            self.GET(URLString, parameters: parameters, progress: progress, success: success, failure: failure)
        }else if type == .POST {
            //POST
            self.POST(URLString, parameters: parameters, progress: progress, success: success, failure: failure)
        }
    }

}
