//
//  FETabBarItem.swift
//  FETabBar
//
//  Created by FlyElephant on 2017/12/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit
import SnapKit

class FETabBarItem: UIView {

    var itemImageName: String?
    var title: String?
    var titleFont: UIFont?
    var titleColor: UIColor?
    var titleSelectedColor: UIColor?
    var imageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var space: Float = 5.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .gray
        let homeImage: UIImage? = UIImage(named: "tab_icon_choiceness_hl")
        if let image = homeImage {
            self.imageView.image = image
            self.addSubview(imageView)
            self.titleLabel.text = "首页"
            self.titleLabel.font = UIFont.systemFont(ofSize: 14)
            self.titleLabel.textAlignment = .center
            self.addSubview(self.titleLabel)
            self.imageView.snp.makeConstraints({ (make) in
                make.top.equalTo(5)
                make.width.equalTo(20)
                make.height.equalTo(20)
                make.centerX.equalTo(self.snp.centerX).offset(0)
            })
            self.titleLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(imageView.snp.bottom).offset(5)
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.height.equalTo(15)
            })
        }
    }

}
