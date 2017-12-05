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

    var selectedIndex: Int = 0
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
    
    @objc func changeItemStatus(gesture: UITapGestureRecognizer) {
        if let index = gesture.view?.tag {
            if index >= 0 && index < items.count {
                let tabItem: FETabBarItem = self.items[index]
                if !tabItem.isSelected {
                    tabItem.switchState(state: .selected)
                }
                for i in 0..<items.count {
                    if i != index && tabItem.isSelected  {
                        let item: FETabBarItem = self.items[i]
                        item.switchState(state: .normal)
                    }
                }
            }
        }
    }

    func update(originalTabs: [FETabBarItem], newTabs: [FETabBarItem]) {
        for tabItem in originalTabs {
            tabItem.removeFromSuperview()
        }
        if newTabs.count > 0 {
            let width: CGFloat = self.frame.size.width / (CGFloat)(newTabs.count)
            for i in 0..<newTabs.count {
                let tabItem = newTabs[i]
                tabItem.frame = CGRect(x: (CGFloat)(i) * width, y: 0, width: width, height: self.frame.size.height)
                let tap: UITapGestureRecognizer = UITapGestureRecognizer()
                tap.addTarget(self, action: #selector(changeItemStatus(gesture:)))
                tabItem.addGestureRecognizer(tap)
                tabItem.updateUI()
                self.addSubview(tabItem)
            }
        }
    }
}

