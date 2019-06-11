//
//  CustomTableViewCell.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 25/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

typealias voidClosure = () -> Void
class CustomTableViewCell: UITableViewCell {
    
    var detailsButtonClosure:voidClosure?

    
    private let docImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "doctor")?.withRenderingMode(.alwaysOriginal))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var detailsButton: UIButton = {
        let db = UIButton(frame: .zero)
        db.setTitle("DETAILS", for: .normal)
        db.layer.borderColor = UIColor.darkGray.cgColor
        db.layer.borderWidth = 2.5
        db.layer.cornerRadius = 5
        db.backgroundColor = UIColor.blue
//        db.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return db
    }()
    
    
    @objc func tap(){
        guard  let detailsButtonClosure = self.detailsButtonClosure  else {
            return
        }
        detailsButtonClosure()
    }
    
    func addDetailsAction(tapAction: VoidClosure?) {
        self.detailsButtonClosure = tapAction
    }
    
    lazy var namelbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        return lbl
    }()
    
    lazy var doctypelbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        return lbl
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = UIColor.rgb(r: 154, g: 143, b: 240, a: 1)
        [docImage, detailsButton, namelbl, doctypelbl].forEach {addSubview($0)}
        configImageView()
        configButton()
        configNameLabelView()
        configDocTypeLabelView()
    }
    
    func configImageView () {
        docImage.anchors(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: nil,
                         padding: .init(top:6, left:4, bottom:6, right:0),
                         size: .init(width:100, height:0))
    }
    
    func configButton() {
        let height:CGFloat = self.frame.size.height - 20
        detailsButton.anchors(top: self.topAnchor,
                              leading: nil,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: .init(top:height/2, left:0, bottom:height/2, right:4),
                              size: .init(width:100, height:0))
        detailsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    }
    
    func configNameLabelView () {
        namelbl.anchors(top: self.topAnchor,
                        leading: docImage.trailingAnchor,
                        bottom: nil,
                        trailing: detailsButton.leadingAnchor,
                        padding: .init(top:6, left:8, bottom:0, right:4),
                        size: .init(width:0, height:45))
    }
    
    func configDocTypeLabelView() {
        doctypelbl.anchors(top: namelbl.bottomAnchor,
                           leading: docImage.trailingAnchor,
                           bottom: nil,
                           trailing: detailsButton.leadingAnchor,
                           padding: .init(top:6, left:8, bottom:0, right:4),
                           size: .init(width:0, height:45))
    }
}


