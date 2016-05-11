//
//  MHStatus.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/10.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHStatus: NSObject {
///    created_at	string	微博创建时间
    var created_at: String?
///    id	int64	微博ID
    var id: Int = 0
///    idstr	string	字符串型的微博ID
    var idstr: String?
///    text	string	微博信息内容
    var text: String?
///    source	string	微博来源
    var source: String?

///    user	object	微博作者的用户信息字段
    var user: MHStatusUser?


    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)

        // 调用完KVC后再手动赋值
        if let userDic = dic["user"] as? [String: AnyObject] {
            user = MHStatusUser(dic: userDic)
        }
    }

    // 实现防止崩溃的方法
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

}
