//
//  ViewController.swift
//  BaseiOS_Swift
//
//  Created by ruixinyi on 2021/3/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let button_1: UIButton = UIButton.init(frame: CGRect(x: 50, y: 50, width: 100, height: 40))
        button_1.backgroundColor = UIColor.purple;
        button_1.setTitle("Action_1", for: UIControl.State.normal)
        button_1.addTarget(self, action: #selector(self.action_1), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button_1)
        
    }
    
    @objc func action_1() {
        print("Press button Action_1");
        
        let sum = SRMethod.sum(2, b: 3)
        print("sum is \(sum)")
        
        let method = SRMethod()
        let sub = method.sub(3, b: 2)
        print("sub is \(sub)")
    }


}

