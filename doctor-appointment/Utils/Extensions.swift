//
//  Extensions.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 25/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit


extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}

extension UIView {
    func anchors(top: NSLayoutYAxisAnchor?,
                 leading: NSLayoutXAxisAnchor?,
                 bottom: NSLayoutYAxisAnchor?,
                 trailing: NSLayoutXAxisAnchor?,
                 padding: UIEdgeInsets = .zero,
                 size: CGSize = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.height != 0 {self.heightAnchor.constraint(equalToConstant: size.height).isActive = true}
        if size.width != 0 {self.widthAnchor.constraint(equalToConstant: size.width).isActive = true}
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension UITextField {
    func setBottomBorder(backGroundColor: UIColor, borderColor: UIColor){
        self.layer.backgroundColor = backGroundColor.cgColor
        // define the layers shadow
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowColor = borderColor.cgColor
    }
}
