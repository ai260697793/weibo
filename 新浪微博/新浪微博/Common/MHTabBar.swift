//
//  MHTabBar.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit

class MHTabBar: UITabBar {
    
    // 第一步:定义一个闭包属性
    var closure: (()->())?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index: CGFloat = 0
        
        let width = bounds.width / 5.0
        
        for subview in subviews {
            if subview.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                subview.frame = CGRectMake(index * width, 0, width, bounds.height)
                index += 1
                if index == 2 {
                    index += 1
                }
            }
        }
        
        composeButton.frame = CGRectMake(width * 2, 0, width, bounds.height)
    }
    
    private func setupUI(){
        addSubview(composeButton)
    }
    
    func showPublish() {
        // 第二部: 调用闭包
        closure?()
    }
    
    // 懒加载一个按钮
    lazy var composeButton: UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState:UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        button.sizeToFit()
        
        // 添加点击事件
        button.addTarget(self, action: #selector(MHTabBar.showPublish), forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }()

}
