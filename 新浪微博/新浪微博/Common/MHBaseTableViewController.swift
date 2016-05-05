//
//  MHBaseTableViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/4.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHBaseTableViewController: UITableViewController {
    
    var isLogin: Bool = false
    

    var visitorView: MHVisitorView?
    
    
    override func loadView() {
        if isLogin {
            super.loadView()
        }else {
            
            visitorView = MHVisitorView()
            view = visitorView
        }        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

}
