//
//  MHOriginalView.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/10.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import SnapKit

let MHOriginalViewMargin: CGFloat = 10

class MHOriginalView: UIView {

    var originalViewModel: MHStatusViewModel?{
        didSet {
            nameLabel.text = originalViewModel?.status?.user?.screen_name
            timeLabel.text = originalViewModel?.status?.created_at
            contentLabel.text = originalViewModel?.status?.text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 加载控件
    private func setupUI(){
        addSubview(photoImageView)
        addSubview(verfityImageView)
        addSubview(levelImageView)
        addSubview(nameLabel)
        addSubview(timeLabel)
        addSubview(sourceLabel)
        addSubview(contentLabel)
    }

    // MARK: - 布局子控件
    override func layoutSubviews() {


        super.layoutSubviews()

        ///  头像
        photoImageView.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left).offset(MHOriginalViewMargin)
            make.top.equalTo(self.snp_top).offset(MHOriginalViewMargin)

            make.width.height.equalTo(50)
        }

        ///  昵称
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(photoImageView.snp_right).offset(MHOriginalViewMargin)
            make.top.equalTo(photoImageView.snp_top)
        }

        ///  等级
        levelImageView.snp_makeConstraints { (make) in
            make.centerY.equalTo(nameLabel.snp_centerY)
            make.left.equalTo(nameLabel.snp_right).offset(MHOriginalViewMargin)
        }

        ///  认证
        verfityImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(photoImageView.snp_right)
            make.centerY.equalTo(photoImageView.snp_bottom)
        }

        ///  时间
        timeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(photoImageView.snp_right).offset(MHOriginalViewMargin)
            make.bottom.equalTo(photoImageView.snp_bottom)
        }

        ///  内容
        contentLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left)
            make.top.equalTo(photoImageView.snp_bottom).offset(MHOriginalViewMargin)
            make.right.equalTo(self.snp_right)
        }

        ///  用来自动计算行高
        self.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentLabel.snp_bottom)
        }
    }

    // MARK: - 懒加载控件
    ///  头像
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar_default_big"))
        return imageView
    }()

    ///  认证
    private lazy var verfityImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar_vip"))
        return imageView
    }()

    ///  等级
    private lazy var levelImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "common_icon_membership"))
        return imageView
    }()

    ///  昵称
    private lazy var nameLabel: UILabel = UILabel(size: 15, color: UIColor.lightGrayColor(), isSingleLine: true)
    ///  时间
    private lazy var timeLabel: UILabel = UILabel(size: 13, color: UIColor.orangeColor(), isSingleLine: true)
    ///  来源
    private lazy var sourceLabel: UILabel = UILabel(size: 13, color: UIColor.darkGrayColor(), isSingleLine: true)
     /// 内容
    private lazy var contentLabel: UILabel = UILabel(size: 15, color: UIColor.darkGrayColor(), isSingleLine: false)
}
