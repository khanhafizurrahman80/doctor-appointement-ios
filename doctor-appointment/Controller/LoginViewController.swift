//
//  LoginViewController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 7/6/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        [loginView].forEach{self.view.addSubview($0)}
        layout()
        loginView.addActions {
            self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
        }
    }
    
    private func layout() {
        loginView.anchors(top: self.view.safeAreaLayoutGuide.topAnchor,
                          leading: self.view.safeAreaLayoutGuide.leadingAnchor,
                          bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                          trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                          padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                          size: .init(width: 0, height: 0))
        
    }
}

extension LoginViewController: LoginViewDelegate {
    func goToSignInPage() {
        
        print ("inside controller delegate!!")
        self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
}
