//
//  SimpleViewController.swift
//  BoxViewExample
//
//  Created by Vlad on 1/16/20.
//  Copyright © 2020 Vladimir Dudkin. All rights reserved.
//

import UIKit

class SimpleViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let titleLabel = UILabel.withText("Simple Layout", color: .red)
        let textLabel = UILabel.withText("This is an example of very simple vertical box with stack of three views:\nAll these views have simplest 'zero' layout - they pinned to superview and to each other and have no own padding.\nStack as whole has padding from superview defined by boxView 'insets' property. And spacing between views is defined by boxView 'spacing' property. \nAny of these views can be skiped in boxView.items, without affecting other views.", color: .lightGray)
        let button = UIButton.withText("Next >", color: .green)
        button.addTarget(self, action:#selector(onClickButton), for: .touchUpInside)
        boxView.backgroundColor = .yellow
        
        //All layouting code is here:
        boxView.insets = UIEdgeInsets(top: 40.0, left: 20.0, bottom: 10.0, right: 20.0)
        boxView.spacing = 10.0
        boxView.items = [
            titleLabel.zeroLayout,
            textLabel.zeroLayout,
            button.zeroLayout,
        ]
    }
    
    @objc func onClickButton(sender: UIButton) {
        self.navigationController?.pushViewController(MixLayoutViewController(), animated: true)
    }
    
}
