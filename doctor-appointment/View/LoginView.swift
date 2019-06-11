//
//  LoginView.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 7/6/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
    func goToSignInPage()
}

class LoginView: UIView {
    
    var accountHaveButtonAction: VoidClosure?
    var delegate: LoginViewDelegate?
    
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
    
    let loginButton: UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(.white, for: .normal)
        l.setTitle("Log In", for: .normal)
        l.backgroundColor = .purple
        l.layer.cornerRadius = 10
        return l
    }()
    
    let forgotPassword: UIButton = {
        let f = UIButton(type: .system)
        f.setTitleColor(.white, for: .normal)
        f.setTitle("Forgot PassWord?", for: .normal)
        f.backgroundColor = GREEN_THEME
        return f
    }()
    
    let accountHaveButton: UIButton = {
        let color = UIColor.rgb(r: 89, g: 156, b: 128, a: 1)
        let font = UIFont.systemFont(ofSize: 16)
        let accB = UIButton(type: .system)
        accB.backgroundColor = GREEN_THEME
        let attributeTitle = NSMutableAttributedString(string: "Don't Have an account? ", attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font])
        attributeTitle.append(NSAttributedString(string: "Sign UP",
                                                 attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                              NSAttributedString.Key.font : font]))
        accB.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        accB.setAttributedTitle(attributeTitle, for: .normal)
        return accB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        layOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    
    private func setupView(){
        self.backgroundColor = GREEN_THEME
        [emailTextField,passwordTextField,loginButton,forgotPassword, accountHaveButton].forEach{addSubview($0)}
    }
    
    private func layOut(){
        emailTextFieldLayout()
        passwordTextFieldLayout()
        loginButtonLayout()
        forgotPasswordLayout()
        accountHaveButtonLayout()
    }
    
    private func emailTextFieldLayout(){
        emailTextField.anchors(top: nil,
                               leading: self.leadingAnchor,
                               bottom: nil,
                               trailing: self.trailingAnchor,
                               padding: .init(top: 0, left: 16, bottom: 0, right: 16),
                               size: .init(width: 0, height: 40))
        
        emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func passwordTextFieldLayout(){
        passwordTextField.anchors(top: emailTextField.bottomAnchor,
                                  leading: emailTextField.leadingAnchor,
                                  bottom: nil,
                                  trailing: emailTextField.trailingAnchor,
                                  padding: .init(top: 8, left: 0, bottom: 0, right: 0),
                                  size: .init(width: 0, height: 40))
    }
    
    private func loginButtonLayout(){
        loginButton.anchors(top: passwordTextField.bottomAnchor,
                            leading: emailTextField.leadingAnchor,
                            bottom: nil,
                            trailing: emailTextField.trailingAnchor,
                            padding: .init(top: 16, left: 0, bottom: 0, right: 0),
                            size: .init(width: 0, height: 40))
        
        loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    fileprivate func forgotPasswordLayout(){
        forgotPassword.anchors(top: loginButton.bottomAnchor,
                               leading: emailTextField.leadingAnchor,
                               bottom: nil,
                               trailing: emailTextField.trailingAnchor,
                               padding: .init(top: 16, left: 0, bottom: 0, right: 0),
                               size: .init(width: 0, height: 40))
        
        
    }

    
    private func accountHaveButtonLayout(){
        accountHaveButton.anchors(top: nil,
                                  leading: self.leadingAnchor,
                                  bottom: self.bottomAnchor,
                                  trailing: self.trailingAnchor,
                                  padding: .init(top: 0, left: 24, bottom: 16, right: 24),
                                  size: .init(width: 0, height: 0))
    }
    
    @objc func signupAction(){
        print ("sign up action")
//        delegate?.goToSignInPage()
        guard let action = accountHaveButtonAction else { return }
        action()
    }

    func addActions(haveAccountButtonAction: VoidClosure?) {
        self.accountHaveButtonAction = haveAccountButtonAction
    }
}

extension LoginView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
