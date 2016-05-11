//
//  MHHomeTableViewCell.swift
//  新浪微博
//
//  Created by 莫煌 on 16/5/10.
//  Copyright © 2016年 MH. All rights reserved.
//

import UIKit
import SnapKit

class MHHomeTableViewCell: UITableViewCell {

    var statusViewModel:MHStatusViewModel?{
        didSet {
            originalView.originalViewModel = statusViewModel
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 加载控件
    private func setupUI(){
        contentView.addSubview(originalView)



    }

    // MARK: - 设置约束
    override func layoutSubviews() {
        super.layoutSubviews()

        originalView.snp_makeConstraints { (make) in
            make.left.equalTo(contentView.snp_left)
            make.top.equalTo(contentView.snp_top)
            make.right.equalTo(contentView.snp_right)
            make.bottom.equalTo(contentView.snp_bottom)
        }

        // 自动计算行高,设置contentView的边界
        contentView.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left)
            make.top.equalTo(self.snp_top)
            make.right.equalTo(self.snp_right)

            make.bottom.equalTo(originalView.snp_bottom)
        }


    }

    // MARK: - 懒加载控件
    private lazy var originalView: MHOriginalView = MHOriginalView()
}
