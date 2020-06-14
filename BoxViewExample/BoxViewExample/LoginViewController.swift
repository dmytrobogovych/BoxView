//
//  LoginViewController.swift
//  BoxViewExample
//
//  Created by Vlad on 5/23/20.
//  Copyright © 2020 Vlad. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    let nameField = UITextField.alWithText("", hint: "User name")
    
    let passwordField = UITextField.alWithText("", hint: "Password")
    
    let loginButton = UIButton.alWithText("Log in", color: .darkGreen)
    
    let forgotButton = UIButton()
    
    let titleLabel = UILabel.alWithText("Please log into account with your user name and password", font: .boldSystemFont(ofSize: 22), numberOfLines: 0)
    
    static let imgSize = CGSize(width: 24.0, height: 24.0)
    
    let nameImageView = UIImageView.alWithImageName("un.png", size: imgSize)
    
    let passwordImageView = UIImageView.alWithImageName("key.png", size: imgSize)
        
    let errorLabel = UILabel.alWithText(" Field can not be empty!", textColor: .red)
    
    let nameBoxView = BoxView(axis: .x, spacing: 10.0)
    
    let passwordBoxView = BoxView(axis: .x, spacing: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        view.backgroundColor = .white
        boxView.setBorder(color: .black)
        boxView.layer.cornerRadius = 10.0
        loginButton.layer.cornerRadius = 5.0
        loginButton.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 16.0, bottom: 5.0, right: 16.0)
        loginButton.addTarget(self, action:#selector(onClickButton), for: .touchUpInside)
        forgotButton.setTitleColor(.blue, for: .normal)
        let btnTitle = NSAttributedString(string: "Forgot password?", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
             NSAttributedString.Key.foregroundColor: UIColor.blue])
        forgotButton.setAttributedTitle(btnTitle, for: .normal)
        nameField.addTarget(self, action:#selector(onChangeTextField), for: .editingChanged)
        passwordField.addTarget(self, action:#selector(onChangeTextField), for: .editingChanged)
        passwordField.isSecureTextEntry = true
        
        // all layout code is here:
        nameBoxView.items = [nameImageView.yAligned(), nameField.boxZero]
        passwordBoxView.items = [passwordImageView.yAligned(), passwordField.boxZero]
        boxView.insets = .all(16.0)
        boxView.spacing = 20.0
        
        boxView.items = [
            titleLabel.xAligned(padding: 30.0).boxBottom(20.0),
            nameBoxView.boxZero,
            passwordBoxView.boxZero,
            forgotButton.boxLeftRight(>=0.0, 0.0),
            loginButton.boxTop(30.0).boxLeftRight(50.0, 50.0)
        ]
    }
    
    func validateField(_ field: UITextField) -> Bool {
        if field.text?.isEmpty ?? true {
            let frame = field.convert(field.bounds, to: boxView)
            let offset = CGPoint(x: -boxView.spacing, y: frame.minX - boxView.insets.left)
            errorLabel.removeFromSuperview()
            boxView.insertItem(errorLabel.boxTop(==offset.x).boxLeft(==offset.y), after: field.superview)
            boxView.sendSubviewToBack(errorLabel)
            errorLabel.frame = frame
            boxView.animateChangesWithDurations(0.3)
            return false
        }
        return true
    }
    
    @objc func onClickButton(sender: UIButton) {
        for field in [nameField, passwordField] {
            if !validateField(field) {
                return
            }
        }
        self.navigationController?.pushViewController(PuppiesViewController(), animated: true)
    }
    
    @objc func onChangeTextField(sender: UITextField) {
        errorLabel.removeFromSuperview()
        boxView.animateChangesWithDurations(0.3)
    }
    
}
