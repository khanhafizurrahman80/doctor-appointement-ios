//
//  IndividualDocDetails.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 27/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class IndividualDocDetails: UIView {
    
    lazy var docImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "doctor")?.withRenderingMode(.alwaysOriginal))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var docdesclabel : UILabel = {
        let ddl = UILabel(frame: .zero)
        ddl.numberOfLines = 0 // required for executing forcefully enter
        return ddl
    }()
    
    lazy var backButton: UIButton = {
        let bb = UIButton(frame: .zero)
        bb.setTitle("Back", for: .normal)
        bb.layer.borderColor = UIColor.darkGray.cgColor
        bb.layer.borderWidth = 2.5
        bb.layer.cornerRadius = 5
        bb.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return bb
    }()
    
    lazy var bookAppButton: UIButton = {
        let bb = UIButton(frame: .zero)
        bb.setTitle("Book Appointment", for: .normal)
        bb.layer.borderColor = UIColor.darkGray.cgColor
        bb.layer.borderWidth = 2.5
        bb.layer.cornerRadius = 5
        bb.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return bb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setupView()
        
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.rgb(r: 111, g: 115, b: 130, a: 1)
        let views = [docImage, docdesclabel, backButton, bookAppButton]
        views.forEach{addSubview($0)}
        layoutUI()
    }
    
    private func layoutUI() {
        layoutdocImage()
        layoutdocDesc()
        layoutBackButton()
        layoutBookAppButton()
    }
    
    private func layoutdocImage() {
        docImage.anchors(top: self.topAnchor,
                         leading: nil,
                         bottom: nil,
                         trailing: self.trailingAnchor,
                         padding: .init(top:6, left:0, bottom:6, right:4),
                         size: .init(width:100, height:0))
    }
    
    private func layoutdocDesc() {
        docdesclabel.anchors(top: self.topAnchor,
                             leading: self.leadingAnchor,
                             bottom: self.bottomAnchor,
                             trailing: docImage.trailingAnchor,
                             padding: .init(top: 6, left: 4, bottom: 50, right: 4),
                             size: .init(width: 0, height: 0))
    }
    
    private func layoutBackButton() {
        
        backButton.anchors(top: docdesclabel.bottomAnchor,
                           leading: self.leadingAnchor,
                           bottom: self.bottomAnchor,
                           trailing: nil,
                           padding: .init(top: 6, left: 4, bottom: 6, right: 0),
                           size: .init(width: UIScreen.main.bounds.width/3, height: 0))
    }
    
    private func layoutBookAppButton () {
        bookAppButton.anchors(top: docdesclabel.bottomAnchor,
                           leading: nil,
                           bottom: self.bottomAnchor,
                           trailing: self.trailingAnchor,
                           padding: .init(top: 6, left: 0, bottom: 6, right: 16),
                           size: .init(width: (2*UIScreen.main.bounds.width/3) - 32, height: 0))
    }
    
    
    
    @objc private func tap() {
        
    }
}
