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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup() {
        let tabBarItem: FETabBarItem = FETabBarItem(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        self.view.addSubview(tabBarItem)
        
        self.testButton.setTitle("测试", for: .normal)
        self.testButton.backgroundColor = .red
        self.view.addSubview(self.testButton)
        self.testButton.snp.makeConstraints { (make) in
            make.left.equalTo(80)
            make.right.equalTo(-80)
            make.height.equalTo(50)
            make.bottom.equalTo(-50)
        }
    }

}

