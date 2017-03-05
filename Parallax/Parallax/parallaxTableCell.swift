//
//  parallaxTableCell.swift
//  图片滚动延迟效果
//
//  Created by zhi zhou on 2017/3/5.
//  Copyright © 2017年 zhi zhou. All rights reserved.
//

import UIKit

class parallaxTableCell: UITableViewCell {
    
    // MARK:- 属性
    /// 视差 imageView
    let parallaxImageView = UIImageView()
    
    /// cell 高度
    var cellHeight: CGFloat = 200
    
    
    // MARK:- 方法函数
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupInterface() {
        selectionStyle = .none
        selectedBackgroundView = nil
        clipsToBounds = true
        contentView.clipsToBounds = true
        
        parallaxImageView.frame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: cellHeight))
        parallaxImageView.contentMode = .center
        
        contentView.addSubview(parallaxImageView)
    }
    
    /// 视差效果
    /// - parameter offsetY: Y轴 偏移量
    /// - parameter tableViewHeight: Table View 高度
    func parallax(offsetY: CGFloat, tableViewHeight: CGFloat) {
        
        var deltaY = (frame.origin.y + frame.height * 0.5) - offsetY
        deltaY = min(tableViewHeight, max(deltaY, 0))

        var move = deltaY / tableViewHeight * 100
        move = move * 0.5 - move
        
        setImage(offset: CGPoint(x: 0, y: move))
    }
    
    /// 设置图像偏移
    fileprivate func setImage(offset: CGPoint) {
        parallaxImageView.frame.origin = offset
    }
    
}
