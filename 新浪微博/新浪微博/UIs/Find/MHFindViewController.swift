//
//  MHFindViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHFindViewController: MHBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView?.setupInfo("登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过", image: "visitordiscover_image_message")
        
    }
    
}
