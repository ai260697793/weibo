//
//  MHMessageViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHMessageViewController: MHBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView?.setupInfo("登录后，别人评论你的微博，发给你的消息，都会在这里收到通知", image: "visitordiscover_image_message")
        // Do any additional setup after loading the view.
    }

}
