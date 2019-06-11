//
//  CustomButton.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 25/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

typealias VoidClosure = () -> Void

class CustomButton: UIButton {
    
    var action: VoidClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    // this is required for story board button
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        
        backgroundColor = UIColor.blue
        titleLabel?.font = UIFont(name: "aa", size: 18)
        layer.cornerRadius = 25
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.darkGray.cgColor
        
        self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8 , y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    @objc func tap() {
        guard let action = self.action else {
            return
        }
        action()
    }
    
    func addAction(tapAction: VoidClosure?) {
        self.action = tapAction
    }
}
