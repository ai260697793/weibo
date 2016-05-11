//
//  MHOauthViewModel.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/6.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHOauthViewModel: NSObject {

    var userAccount: MHUserAccount?

    // 创建单例
    static let sharedInstance: MHOauthViewModel = MHOauthViewModel()

    var isLogin: Bool {
        get{
            return userAccount?.access_token != nil
        }
    }

    // 经常用到access_token 所以对其进行优化
    var access_token: String? {
        return userAccount?.access_token
    }

    // 在初始化时给userAccount读取数据
    private override init() {
        super.init()
        userAccount = MHUserAccount.readUserAccount()
    }

    func loadToken(code: String, success: ()->(), failed: ()->()) {
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        let parameters = ["client_id":AppKey, "client_secret":AppSecret, "grant_type":"authorization_code", "code":code, "redirect_uri":AppRedictUrl]
        
        MHHTTPClient.sharedInstance.request(MHHTTPClientType.POST, URLString: urlString, parameters: parameters, success: { (_, JSON) in

            if let json = JSON as? [String:AnyObject] {
                let model = MHUserAccount(dic: json)
                
                // 获取token后进行数据请求来获取用户信息
                self.loadInfo(model, success: success, failed: failed)
            }
            
            }) { (_, error) in
                print(error)
                failed()
        }
    }
    
    private func loadInfo(model: MHUserAccount, success: ()->(), failed: ()->()) {
        guard let uid = model.uid , token = model.access_token else {
            return
        }
        
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        let parameters = ["access_token":token, "uid":uid]
        
        
        MHHTTPClient.sharedInstance.request(MHHTTPClientType.GET, URLString: urlString, parameters: parameters, success: { (_, JSON) in
                //成功获取到用户信息
//                print(JSON)
            if let json = JSON as? [String: AnyObject] {
                //"name": 港湾那边,
                //"profile_image_url": http://tva2.sinaimg.cn/crop.0.200.1200.1200.50/b9962ea7jw1e8vpblvt0fj20xc18gaou.jpg
                model.screen_name = json["screen_name"] as? String
                model.profile_image_url = json["profile_image_url"] as? String
                
                // 进行归档
                // 获取沙盒路径
                let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last!
                // 拼接文件路劲
                // swift 中的String 可以灵活的转换成 NSSring，转换之后可以掉用OC里 的方法
                let filePath = (path as NSString).stringByAppendingPathComponent("MH.hm")
                
                NSKeyedArchiver.archiveRootObject(model, toFile: filePath)

                self.userAccount = model
                // 归档完成,授权界面消失,切换视图控制器
                success()
                
            }
            }) { (_, error) in
                print(error)
                failed()
        }
        
    }
}
