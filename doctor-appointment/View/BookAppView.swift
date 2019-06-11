//
//  BookAppView.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 28/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

protocol BookAppViewDelegate {
    func makeBookAppData(with appointmentBook : AppointmentBook)
}

class BookAppView: UIView {
    
    var delegate: BookAppViewDelegate?
    
    lazy var backButton: UIButton = {
        let bb = UIButton(frame: .zero)
        bb.setTitle("Back", for: .normal)
        bb.layer.borderColor = UIColor.darkGray.cgColor
        bb.layer.borderWidth = 2.5
        bb.layer.cornerRadius = 5
        //bb.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return bb
    }()
    
    lazy var datePicker: UIDatePicker = {
        let pv = UIDatePicker(frame: .zero)
        pv.datePickerMode = .dateAndTime
        pv.minuteInterval = 30
        pv.backgroundColor = UIColor.clear
        pv.minimumDate = Date()
        pv.tintColor = UIColor.blue
        return pv
    }()
    
    lazy var dateselectedLabel: UILabel = {
        let dsl = UILabel(frame: .zero)
        dsl.backgroundColor = UIColor.clear
        dsl.text = "Display Date"
        return dsl
    }()
    
    lazy var sendButton: UIButton = {
        let bb = UIButton(frame: .zero)
        bb.setTitle("Send", for: .normal)
        bb.layer.borderColor = UIColor.darkGray.cgColor
        bb.layer.borderWidth = 2.5
        bb.layer.cornerRadius = 5
        //bb.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return bb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.rgb(r: 135, g: 206, b: 250, a: 1)
        [backButton, datePicker, dateselectedLabel, sendButton].forEach{addSubview($0)}
    }
    
    private func layout() {
        dateselectedLabelLayout()
        pickerViewLayout()
        sendButtonLayout()
        backButtonLayout()
    }
    
    private func dateselectedLabelLayout() {
        dateselectedLabel.anchors(top: self.topAnchor,
                                  leading: nil,
                                  bottom: nil,
                                  trailing: nil,
                                  padding: .init(top: 16, left: 8, bottom: 0, right: 8),
                                  size: .init(width: 0, height: 50))
        dateselectedLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func pickerViewLayout() {
        datePicker.anchors(top: dateselectedLabel.bottomAnchor,
                           leading: self.leadingAnchor,
                           bottom: self.bottomAnchor,
                           trailing: self.trailingAnchor,
                           padding: .init(top: 30, left: 20, bottom: 200, right: 20),
                           size: .init(width: 0, height: 0))
    }
    
    private func sendButtonLayout() {
        sendButton.anchors(top: datePicker.bottomAnchor,
                           leading: nil,
                           bottom: nil,
                           trailing: nil,
                           padding: .init(top: 8, left: 0, bottom: 0, right: 0),
                           size: .init(width: 100, height: 0))
        sendButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func backButtonLayout() {
        backButton.anchors(top: nil,
                           leading: self.leadingAnchor,
                           bottom: self.bottomAnchor,
                           trailing: self.trailingAnchor,
                           padding: .init(top: 0, left: 20, bottom: 8, right: 20),
                           size: .init(width: 0, height: 0))
        backButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    

}


