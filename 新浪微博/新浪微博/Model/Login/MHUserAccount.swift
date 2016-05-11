//
//  MHUserAccount.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/6.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHUserAccount: NSObject, NSCoding {
    
     /// 用户授权的唯一票据
    var access_token: String?



     /// access_token的生命周期，单位是秒数
    var expires_in: NSTimeInterval = 0 {
        didSet {
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
        }
    }

    /// 定义一个时间属性
    var expires_date: NSDate?

    
     /// 授权用户的UID
    var uid: String?
    
    //"name": 港湾那边 用户昵称
    var screen_name: String?
    //"profile_image_url": 用户头像
    var profile_image_url: String?
    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    
    // 防止崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    // MARK: - 归档和解档
    // 归档
    func encodeWithCoder(aCoder: NSCoder) {

        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(expires_date, forKey: "expires_date")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(screen_name, forKey: "screen_name")
        aCoder.encodeObject(profile_image_url, forKey: "profile_image_url")
    }
    
    // 解档
    required init?(coder aDecoder: NSCoder) {
        self.access_token = aDecoder.decodeObjectForKey("access_token") as? String

        let ex = aDecoder.decodeObjectForKey("expires_date") as? NSDate
        self.expires_date = ex
    }

    // MARK: - 创建一个读取沙盒归档文件的方法
    class func readUserAccount() -> MHUserAccount? {
        // 获取沙盒路劲
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last!
        // 拼接文件的路径
        let filePath = (path as NSString).stringByAppendingPathComponent("MH.hm")

        let count = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? MHUserAccount

        // 判断 access_token 的时效性
        if let date = count?.expires_date {
            if date.compare(NSDate()) == NSComparisonResult.OrderedDescending {
                return count
            }
        }

        return nil
    }
}
