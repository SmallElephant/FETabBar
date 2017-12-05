//
//  ViewController.swift
//  FETabBar
//
//  Created by FlyElephant on 2017/12/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var testButton: UIButton = UIButton(type: .custom)
    var tabBarView: FETabBarView = FETabBarView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeEvent(button: UIButton) {
        print("点击事件")
    }

    func setup() {
//        let tabBarItem: FETabBarItem = FETabBarItem(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
//        self.view.addSubview(tabBarItem)
        var items: [FETabBarItem] = []
        for i in 0..<4 {
            let item: FETabBarItem =  FETabBarItem()
            item.imageName = "tab_icon_choiceness_nm"
            item.selectedColor = .white
            item.selectedTitleColor = .red
            item.itemColor = .gray
            item.titleColor = .black
            item.selectedTitleColor = .black
            item.selectedImageName = "tab_icon_choiceness_hl"
            item.tag = i
            items.append(item)
        }
        self.tabBarView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: 50)
        self.tabBarView.backgroundColor = .red
        self.tabBarView.items = items
        self.view.addSubview(self.tabBarView)
        self.testButton.setTitle("测试", for: .normal)
        self.testButton.backgroundColor = .red
        self.testButton.addTarget(self, action: #selector(changeEvent), for: .touchUpInside)
        self.view.addSubview(self.testButton)
        self.testButton.snp.makeConstraints { (make) in
            make.left.equalTo(80)
            make.right.equalTo(-80)
            make.height.equalTo(50)
            make.bottom.equalTo(-50)
        }
    }

}

