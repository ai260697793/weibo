//
//  MHHomeViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import SVProgressHUD

let MHHomeViewControllerReusableCellIdentifier = "MHHomeViewControllerReusableCellIdentifier"

class MHHomeViewController: MHBaseTableViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        if isLogin {

            loadData()
            // 注册cell
            tableView.registerClass(MHHomeTableViewCell.self, forCellReuseIdentifier: MHHomeViewControllerReusableCellIdentifier)

            // 给cell一个固定行高
            tableView.rowHeight = UITableViewAutomaticDimension
            // 设置预估行高
            tableView.estimatedRowHeight = 200

        } else {
            visitorView?.setupInfo("关注一些人，回这里看看有什么惊喜", image: nil)
        }


    }
    private func loadData(){
        SVProgressHUD.show()
        // 如果登录了,就用token去请求数据
        MHStatusListViewModel.sharedInstance.loadData({
            self.tableView.reloadData()

            SVProgressHUD.dismiss()
            }, failed: { (error) in
                print(error)

                SVProgressHUD.dismiss()
        })

    }
}

extension MHHomeViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MHStatusListViewModel.sharedInstance.statusList.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier(MHHomeViewControllerReusableCellIdentifier, forIndexPath: indexPath) as! MHHomeTableViewCell
        let status = MHStatusListViewModel.sharedInstance.statusList[indexPath.row]

        cell.statusViewModel = status

        return cell
    }
    
    
}
