//
//  RegistrationViewController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 8/6/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    var registrationView = RegistrationView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(registrationView)
        layout()
    }
    
    func layout(){
        registrationView.anchors(top: self.view.safeAreaLayoutGuide.topAnchor,
                                 leading: self.view.safeAreaLayoutGuide.leadingAnchor,
                                 bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                 trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                                 padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                                 size: .init(width: 0, height: 0))
    }
}
