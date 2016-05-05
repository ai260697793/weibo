//
//  MHTabBarViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/4.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController()
        
        let tabbar = MHTabBar()
        
        setValue(tabbar, forKey: "tabBar")
        
        // 第三部:给闭包赋值
        let tabbarClosure = {
            
            print("跳转界面")
        }
        
        
        tabbar.closure = tabbarClosure
        

        // Do any additional setup after loading the view.
    }

    // 重载:相同的方法名,参数个数或参数类型不同
    func addChildViewController(childController: UIViewController ,title: String ,image: String) {
        //设置标题
        childController.title = title
        
        childController.tabBarItem.image = UIImage(named: image)
        
        childController.tabBarItem.selectedImage = UIImage(named: "\(image)_highlighted")
        
        // 添加子控制器
        addChildViewController(UINavigationController(rootViewController: childController))
    }
    
    //
    func addChildViewController() {
        
        addChildViewController(MHHomeViewController(),title: "首页" ,image: "tabbar_home")
        addChildViewController(MHMessageViewController(),title: "消息" ,image: "tabbar_message_center")
        addChildViewController(MHFindViewController(),title: "发现" ,image: "tabbar_discover")
        addChildViewController(MHSettingViewController(),title: "设置" ,image: "tabbar_profile")
    }
    
}
