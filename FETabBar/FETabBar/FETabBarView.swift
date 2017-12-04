//
//  FETabBarView.swift
//  FETabBar
//
//  Created by FlyElephant on 2017/12/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

@objc protocol FETabBarDelegate : NSObjectProtocol {
    @objc optional func tabBar(_ tabBar: FETabBarView, didSelect item: FETabBarItem)
}

class FETabBarView: UIView {

    var _items: [FETabBarItem] = []
    var items: [FETabBarItem] {
        get {
            return _items
        }
        set {
            if newValue != _items {
                self.update(originalTabs: _items, newTabs: newValue)
                _items = newValue
            }
        }
    }
    
    var selectedTabItem: FETabBarItem?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func updateItem(index: Int) {
        
    }

    func update(originalTabs: [FETabBarItem], newTabs: [FETabBarItem]) {
        for tabItem in originalTabs {
            tabItem.removeFromSuperview()
        }
        if newTabs.count > 0 {
            let width: CGFloat = self.frame.size.width / (CGFloat)(newTabs.count)
            for i in 0..<newTabs.count {
                let tabItem = newTabs[i]
                var frame: CGRect = tabItem.frame
                frame.origin.x = (CGFloat)(i - 1) * width
                frame.size.width = width
                self.addSubview(tabItem)
            }
        }
    }
}

