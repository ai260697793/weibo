//
//  MHStatusListViewModel.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/10.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHStatusListViewModel: NSObject {

    // 懒加载数组
    lazy var statusList: [MHStatusViewModel] = [MHStatusViewModel]()

    static let sharedInstance: MHStatusListViewModel = MHStatusListViewModel()

    // MARK: - 加载网络数据
    func loadData(success: ()->(), failed: (error: NSError)->()){
        let url = "https://api.weibo.com/2/statuses/home_timeline.json"

        guard let token = MHOauthViewModel.sharedInstance.access_token else {
            return
        }

        let params = ["access_token": token]

        // 发起请求
        MHHTTPClient.sharedInstance.request(MHHTTPClientType.GET, URLString: url, parameters: params, success: { (_, JSON) in
            // 对数据进行解析
            if let json = JSON as? [String: AnyObject] {
                if let statuses = json["statuses"] as? [[String: AnyObject]] {
                    for status in statuses {
                        // 字典转模型
                        let model = MHStatus(dic: status)
                        let statusViewModel = MHStatusViewModel(model: model)

                        // 将得到的单条微博的模型数据放入数组
                        self.statusList.append(statusViewModel)
                    }

                    success()
                }
            }

            }) { (_, error) in
                failed(error: error)
        }
    }

}
