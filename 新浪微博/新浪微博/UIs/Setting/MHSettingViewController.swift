//
//  MHSettingViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHSettingViewController: MHBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView?.setupInfo("登录后，你的微博、相册、个人资料会显示在这里，展示给别人", image: "visitordiscover_image_profile")
        // Do any additional setup after loading the view.
    }

}
