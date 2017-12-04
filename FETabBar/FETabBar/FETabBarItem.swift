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
    var itemTitle: String?
    var itemImageView: UIImageView = UIImageView()
    var itemTitleLabel: UILabel = UILabel()
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
            self.itemImageView.image = image
            self.addSubview(itemImageView)
            self.itemTitleLabel.text = "首页"
            self.itemTitleLabel.font = UIFont.systemFont(ofSize: 14)
            self.itemTitleLabel.textAlignment = .center
            self.addSubview(self.itemTitleLabel)
            self.itemImageView.snp.makeConstraints({ (make) in
                make.top.equalTo(5)
                make.width.equalTo(20)
                make.height.equalTo(20)
                make.centerX.equalTo(self.snp.centerX).offset(0)
            })
            self.itemTitleLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(itemImageView.snp.bottom).offset(5)
                make.left.right.equalTo(0)
                make.height.equalTo(15)
            })
        }
    }

}
