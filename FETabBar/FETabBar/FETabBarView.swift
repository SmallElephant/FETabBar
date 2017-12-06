//
//  FETabBarView.swift
//  FETabBar
//
//  Created by FlyElephant on 2017/12/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

@objc protocol FETabBarDelegate {
    @objc optional func tabBar(_ tabBar: FETabBarView, didSelect item: FETabBarItem)
}

class FETabBarView: UIView {

    var selectedIndex: Int = 0
    weak open var delegate: FETabBarDelegate?
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

    func switchItem(index: Int) {
        self.updateItem(index: index)
    }
    
    @objc func changeItemStatus(gesture: UITapGestureRecognizer) {
        if let index = gesture.view?.tag {
            self.updateItem(index: index)
        }
    }
    
    func updateItem(index: Int) {
        if index >= 0 && index < items.count {
            let tabItem: FETabBarItem = self.items[index]
            if tabItem.isSelected {
                return
            }
            self.selectedIndex = index
            tabItem.switchState(state: .selected)
            for i in 0..<items.count {
                if i != index && tabItem.isSelected  {
                    let item: FETabBarItem = self.items[i]
                    item.switchState(state: .normal)
                }
            }
            self.delegate?.tabBar?(self, didSelect: tabItem)
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

