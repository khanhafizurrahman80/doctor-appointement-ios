//
//  RegistrationView.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 8/6/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class RegistrationView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let emailTextField: UITextField = {
        let e = UITextField()
        let attributePlaceholder = NSAttributedString(string: "email",
                                                      attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        e.attributedPlaceholder = attributePlaceholder
        e.textColor = .white
        e.setBottomBorder(backGroundColor: GREEN_THEME, borderColor: .white)
        e.backgroundColor = GREEN_THEME
        return e
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        let attributePlaceholder = NSAttributedString(string: "password",
                                                      attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        p.attributedPlaceholder = attributePlaceholder
        p.textColor = .white
        p.isSecureTextEntry = true
        p.backgroundColor = GREEN_THEME
        p.setBottomBorder(backGroundColor: GREEN_THEME, borderColor: .white)
        return p
    }()
    
    let confirmpasswordTextField: UITextField = {
        let p = UITextField()
        let attributePlaceholder = NSAttributedString(string: "confirm password",
                                                      attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        p.attributedPlaceholder = attributePlaceholder
        p.textColor = .white
        p.isSecureTextEntry = true
        p.backgroundColor = GREEN_THEME
        p.setBottomBorder(backGroundColor: GREEN_THEME, borderColor: .white)
        return p
    }()

    let registerButton: UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(.white, for: .normal)
        l.setTitle("Sign In", for: .normal)
        l.backgroundColor = .purple
        l.layer.cornerRadius = 10
        return l
    }()

    
    let accountHaveButton: UIButton = {
        let color = UIColor.rgb(r: 89, g: 156, b: 128, a: 1)
        let font = UIFont.systemFont(ofSize: 16)
        let accB = UIButton(type: .system)
        accB.backgroundColor = GREEN_THEME
        let attributeTitle = NSMutableAttributedString(string: "Already Have an account? ", attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font])
        attributeTitle.append(NSAttributedString(string: "Sign In",
                                                 attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                              NSAttributedString.Key.font : font]))
        accB.setAttributedTitle(attributeTitle, for: .normal)
        return accB
    }()
    
    private func setUpView(){
        self.backgroundColor = GREEN_THEME
        [emailTextField,passwordTextField,confirmpasswordTextField,registerButton,accountHaveButton].forEach{addSubview($0)}
    }
    
    private func layout(){
        emailTextFieldLayout()
        passwordTextFieldLayout()
        confirmPasswordTextFieldLayout()
        registerButtonLayout()
        accountHaveButtonLayout()
    }
    
    private func emailTextFieldLayout(){
        emailTextField.anchors(top: self.centerYAnchor,
                               leading: self.leadingAnchor,
                               bottom: nil,
                               trailing: self.trailingAnchor,
                               padding: .init(top: -80, left: 16, bottom: 0, right: 16),
                               size: .init(width: 0, height: 40))
        
    }
    
    private func passwordTextFieldLayout(){
        passwordTextField.anchors(top: emailTextField.bottomAnchor,
                                  leading: emailTextField.leadingAnchor,
                                  bottom: nil,
                                  trailing: emailTextField.trailingAnchor,
                                  padding: .init(top: 10, left: 0, bottom: 0, right: 0),
                                  size: .init(width: 0, height: 40))
    }
    
    private func confirmPasswordTextFieldLayout(){
        confirmpasswordTextField.anchors(top: passwordTextField.bottomAnchor,
                                  leading: emailTextField.leadingAnchor,
                                  bottom: nil,
                                  trailing: emailTextField.trailingAnchor,
                                  padding: .init(top: 10, left: 0, bottom: 0, right: 0),
                                  size: .init(width: 0, height: 40))
    }
    
    private func registerButtonLayout(){
        registerButton.anchors(top: confirmpasswordTextField.bottomAnchor,
                               leading: emailTextField.leadingAnchor,
                               bottom: nil,
                               trailing: emailTextField.trailingAnchor,
                               padding: .init(top: 10, left: 0, bottom: 0, right: 0),
                               size: .init(width: 0, height: 40))
    }
    
    private func accountHaveButtonLayout(){
        accountHaveButton.anchors(top: nil,
                                  leading: self.leadingAnchor,
                                  bottom: self.bottomAnchor,
                                  trailing: self.trailingAnchor,
                                  padding: .init(top: 0, left: 16, bottom: 16, right: 16),
                                  size: .init(width: 0, height: 40))
    }
}

extension RegistrationView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
