//
//  FETabBarItem.swift
//  FETabBar
//
//  Created by FlyElephant on 2017/12/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit
import SnapKit

enum FETabBarItemState {
    case normal
    case selected
}

class FETabBarItem: UIView {

    var imageName: String?
    var selectedImageName: String?
    var image: UIImage?
    var selectedImage: UIImage?
    var title: String?
    var titleFont: UIFont?
    var titleColor: UIColor?
    var selectedTitleColor: UIColor?
    var itemColor: UIColor?
    var selectedColor: UIColor?
    var isSelected: Bool = false
    var imageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var space: CGFloat = 5.0
    var labelHeight: CGFloat = 15.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    override convenience init(frame: CGRect) {
       self.init()
    }
    
    func switchState(state: FETabBarItemState) {
        switch state {
        case .normal:
            self.titleLabel.textColor = self.titleColor
            self.backgroundColor = self.itemColor
            self.isSelected = false
        case .selected:
            self.titleLabel.textColor = self.selectedTitleColor
            self.backgroundColor = self.selectedColor
            self.isSelected = true
        }
        self.updateImageView()
    }
    
    func updateImageView() {
        let imageName = self.isSelected ? self.selectedImageName : self.imageName
        if let name = imageName {
            let homeImage: UIImage? = UIImage(named: name)
            if let image = homeImage {
                self.imageView.image = image
            }
        }
    }
    
    func updateUI() {
        switchState(state: .normal)
        if let size = self.imageView.image?.size {
            let width: CGFloat = size.width
            let height: CGFloat = size.height
            let top: CGFloat = (self.frame.size.height - height - space - labelHeight) / 2
            self.imageView.snp.makeConstraints({ (make) in
                make.top.equalTo(top)
                make.width.equalTo(width)
                make.height.equalTo(height)
                make.centerX.equalTo(self.snp.centerX).offset(0)
            })
            self.titleLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(imageView.snp.bottom).offset(5)
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.height.equalTo(labelHeight)
            })
        }
    }
    
    func setup() {
        self.addSubview(imageView)
        self.titleLabel.text = "首页"
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel.textAlignment = .center
        self.addSubview(self.titleLabel)
    }
}
