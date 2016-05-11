//
//  MHWelcomeViewController.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/9.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import SnapKit

class MHWelcomeViewController: UIViewController {

    override func loadView() {
        view = bgImageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }


    //  MARK: - 添加控件,设置约束
    private func setupUI(){
        view.addSubview(photoImageView)
        view.addSubview(nameLabel)

        //  设置约束
        photoImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(view.snp_top).offset(UIScreen.mainScreen().bounds.height - 250)
        }
        nameLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(photoImageView.snp_bottom).offset(10)
        }
    }



    //  MARK: -  添加动画
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addAnimation()
    }

    //  MARK: -   动画效果
    private func addAnimation(){
        photoImageView.snp_updateConstraints(closure: { (make) in

            make.top.equalTo(self.view.snp_top).offset(100)
        })

        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: [], animations: {
            self.view.layoutIfNeeded()
            }) { (_) in
                // 切换视图控制器
                // 发送通知
                NSNotificationCenter.defaultCenter().postNotificationName(kNotificationChangeViewController, object: self)
        }
    }

    // MARK: - 懒加载控件
        /// 背景图片
    private lazy var bgImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ad_background"))
        return image
    }()

        /// 头像
    private lazy var photoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "avatar_default_big"))

        // 设置圆角
        image.layer.cornerRadius = 170/2/2.0

        // 设置园边的样式
        image.layer.borderColor = UIColor.lightGrayColor().CGColor
        image.layer.borderWidth = 2

        // 裁剪
        image.clipsToBounds = true
//        image.layer.masksToBounds = true 

        return image
    }()

        /// 文字
    private lazy var nameLabel: UILabel = {
        let label = UILabel()

        label.text = "欢迎回来"

        label.textColor = UIColor.lightGrayColor()

        label.font = UIFont.systemFontOfSize(15)

        label.numberOfLines = 0

        return label
    }()
}
