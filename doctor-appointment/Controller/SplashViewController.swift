//
//  SplashViewController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 25/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var splashImageView: UIImageView = {
        let splashImageView = UIImageView(frame: .zero)
        splashImageView.image = UIImage(named: "splash")
        return splashImageView
    }()
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.isNavigationBarHidden = true
        layout()
        setupTimer()
    }
    
    private func layout() {
        splashImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(splashImageView)
        
        splashImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        splashImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        splashImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        splashImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] timer in
            self?.gotoNextVC()
            timer.invalidate()
        }
    }
    
    private func gotoNextVC() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
