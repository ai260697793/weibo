//
//  MHBaseTableViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/4.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHBaseTableViewController: UITableViewController ,MHVisitorViewDelegate {
    
    var isLogin: Bool = false
    

    var visitorView: MHVisitorView?
    
    
    override func loadView() {
        if isLogin {
            super.loadView()
        }else {
            
            setupNav()
            
            visitorView = MHVisitorView()
            visitorView?.delegate = self
            view = visitorView
        }        
    }
    
    private func setupNav(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MHBaseTableViewController.didRegister))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MHBaseTableViewController.didLogin))
        
    }
}

extension MHBaseTableViewController {
    
    func didRegister() {
        
    }
    
    func didLogin() {
        
    }
}
