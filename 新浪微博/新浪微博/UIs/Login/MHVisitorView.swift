//
//  MHVisitorView.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/5.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import SnapKit

// 定义协议
@objc protocol MHVisitorViewDelegate: NSObjectProtocol {
    optional
    func didRegister()
    func didLogin()
}

class MHVisitorView: UIView {
    
    // 定义一个闭包属性
//    var registerClosure: (()->())?
    // 定义代理属性
    weak var delegate: MHVisitorViewDelegate?
    

    // MARK: - 重写父类的构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 添加子控件并设置约束
    private func setupUI(){
        
        // 添加子控件
        
        addSubview(turnImageView)
        addSubview(maskImageView)
        addSubview(bgImageView)
        addSubview(noticeLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 设置背景颜色
        backgroundColor = UIColor(white: 237.0/255, alpha: 1.0)
        
        // 设置遮罩约束
        maskImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self.snp_center)
        }
        
        // 设置约束
        bgImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self.snp_center)
        }
        turnImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self.snp_center)
        }
        noticeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(turnImageView.snp_bottom).offset(10)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(216)
        }
        registerButton.snp_makeConstraints { (make) in
            make.top.equalTo(noticeLabel.snp_bottom).offset(10)
            make.left.equalTo(noticeLabel.snp_left)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        loginButton.snp_makeConstraints { (make) in
            make.top.equalTo(noticeLabel.snp_bottom).offset(10)
            make.right.equalTo(noticeLabel.snp_right)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    func setupInfo(title: String ,image: String?){
        if image == nil {
            turnImageView.hidden = false
            startAnimation()
        }else {
            turnImageView.hidden = true
            bgImageView.image = UIImage(named: image!)
            noticeLabel.text = title
        }
        
    }
    
    // MARK: - 动画转动
    func startAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 10
        animation.toValue = 2 * M_PI
        animation.repeatCount = MAXFLOAT
        
        animation.removedOnCompletion = false
        
        turnImageView.layer.addAnimation(animation, forKey: nil)
}
 
    // MARK: - 按钮点击事件
    @objc private func registerButtonClick(){
        // 调用
//        registerClosure?()
        delegate?.didRegister?()
    
    }
    
    @objc private func loginButtonClick(){
        delegate?.didLogin()
        
    }


    // MARK: - 懒加载视图
    /// 遮罩视图
    private lazy var maskImageView: UIImageView = {
        let imageView = UIImageView(image:UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return imageView
    }()
    
    ///  共有图片背景
    private lazy var bgImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    return imageView
    
    }()
    
    ///  首页转动图片
    private lazy var turnImageView: UIImageView = {
        let imageView = UIImageView(image:UIImage(named: "visitordiscover_feed_image_smallicon"))
        return imageView
    }()
    
    ///  提示label
    private lazy var noticeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.darkGrayColor()
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.numberOfLines = 0
        return label
    }()
    
    ///  注册按钮
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        button.setTitle("注册", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        
        button.addTarget(self, action: #selector(MHVisitorView.registerButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }()
    
    ///  登录按钮
    private lazy var loginButton: UIButton = {
        
        let button = UIButton(type: UIButtonType.Custom)
        
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        button.setTitle("登录", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        
        button.addTarget(self, action: #selector(MHVisitorView.loginButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
        
    }()
}
