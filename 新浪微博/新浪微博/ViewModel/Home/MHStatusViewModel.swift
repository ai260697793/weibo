//
//  MHStatusViewModel.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/10.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

/// 单条微博数据的ViewModel
class MHStatusViewModel: NSObject {
    var status: MHStatus?

    init(model: MHStatus) {
        self.status = model
        super.init()
    }

}
