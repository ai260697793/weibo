//
//  MHHomeViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHHomeViewController: MHBaseTableViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView?.setupInfo("关注一些人，回这里看看有什么惊喜", image: nil)

//        let closure = {
//            print("回调成功")
//        }
        
//        visitorView?.registerClosure = closure
    }

}
