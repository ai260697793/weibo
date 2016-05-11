//
//  MHStatusUser.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/10.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHStatusUser: NSObject {
///    id	int64	用户UID
    var id: Int = 0
///    idstr	string	字符串型的用户UID
    var idstr: String?
///    screen_name	string	用户昵称
    var screen_name: String?
///    profile_image_url	string	用户头像地址（中图），50×50像素
    var profile_image_url: String?

    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }

}
