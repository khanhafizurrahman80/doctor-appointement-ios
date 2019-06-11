//
//  AddDoctorView.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 26/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

protocol AddDoctorViewDelegate {
    func makeData(with doctor: Doctor)
}

class AddDoctorView: UIView {
    var fNameTextFieldVal: String?
    var lNameTextFieldVal: String?
    var emailAddTextFieldVal: String?
    var phoneNumTextFieldVal: String?
    var categoryNumTextFieldVal: String?
    var dayTextFieldVal: String?
    var timeFieldViewVal: String?
    
    var delegate: AddDoctorViewDelegate?
    
    lazy var fNameTextField : UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter Your First Name"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var lNameTextField: UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter your Last Name"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var emailAddTextField: UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter your Email Address"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var phoneNumTextField: UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter your Phone Number"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var categoryNumTextField: UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter your Category"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var dayTextField: UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter Day"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var timeFieldView: UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter Time"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var contactAddFieldView: UITextField = {
        let textFieldView = UITextField(frame: .zero)
        textFieldView.placeholder = "Enter Contact Address"
        textFieldView.font = UIFont.systemFont(ofSize: 17)
        textFieldView.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldView.keyboardType = UIKeyboardType.default
        textFieldView.autocorrectionType = UITextAutocorrectionType.no
        textFieldView.returnKeyType = UIReturnKeyType.done
        textFieldView.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldView.delegate = self
        return textFieldView
    }()
    
    lazy var sectionlblView : UILabel = {
        let nameLabelView = UILabel(frame: .zero)
        nameLabelView.text = "Doctor Details:"
        return nameLabelView
    }()
    
    lazy var customButtonLblView : CustomButton = {
        let customButton = CustomButton()
        customButton.setTitle("Send", for: .normal)
        customButton.addAction(tapAction: {
            self.buttonTapped()
        })
        return customButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func buttonTapped() {
        print ("tapped")
        
        let doctorDetails = [DoctorDetails(day: dayTextField.text ?? "",
                                          time: timeFieldView.text ?? "",
                                          contactAddress: contactAddFieldView.text ?? "")]
        
        let doctor = Doctor(firstName: fNameTextField.text ?? "",
                            lastName: lNameTextField.text ?? "",
                            emailAddress: emailAddTextField.text ?? "",
                            phoneNumber: phoneNumTextField.text ?? "",
                            category: categoryNumTextField.text ?? "",
                            doctorDetails: doctorDetails)
        
        delegate?.makeData(with: doctor)
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.rgb(r: 111, g: 115, b: 130, a: 1)
        setupLayout()
    }
    
    private func setupLayout() {
        fNameTextFieldLayout()
        lNameTextFieldLayout()
        emailAddTextFieldLayout()
        phoneNumTextFieldLayout()
        categoryNumTextFieldLayout()
        sectionlblViewLayout()
        dayTextFieldLayout()
        timeFieldViewLayout()
        contactAddFieldViewLayout()
        customButtonViewLayout()
    }
    
    private func fNameTextFieldLayout() {
        fNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(fNameTextField)
        
        fNameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        fNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        fNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        fNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func lNameTextFieldLayout() {
        lNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lNameTextField)
        
        lNameTextField.topAnchor.constraint(equalTo: fNameTextField.bottomAnchor, constant: 8).isActive = true
        lNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        lNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        lNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func emailAddTextFieldLayout() {
        emailAddTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailAddTextField)
        
        emailAddTextField.topAnchor.constraint(equalTo: lNameTextField.bottomAnchor, constant: 8).isActive = true
        emailAddTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        emailAddTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        emailAddTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func phoneNumTextFieldLayout() {
        phoneNumTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneNumTextField)
        
        phoneNumTextField.topAnchor.constraint(equalTo: emailAddTextField.bottomAnchor, constant: 8).isActive = true
        phoneNumTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        phoneNumTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        phoneNumTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func categoryNumTextFieldLayout() {
        categoryNumTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(categoryNumTextField)
        
        categoryNumTextField.topAnchor.constraint(equalTo: phoneNumTextField.bottomAnchor, constant: 8).isActive = true
        categoryNumTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        categoryNumTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        categoryNumTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    private func sectionlblViewLayout(){
        sectionlblView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sectionlblView)
        
        sectionlblView.topAnchor.constraint(equalTo: categoryNumTextField.bottomAnchor, constant: 8).isActive = true
        sectionlblView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sectionlblView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func dayTextFieldLayout() {
        dayTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dayTextField)
        
        dayTextField.topAnchor.constraint(equalTo: sectionlblView.bottomAnchor, constant: 8).isActive = true
        dayTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        dayTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        dayTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func timeFieldViewLayout() {
        timeFieldView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timeFieldView)
        
        timeFieldView.topAnchor.constraint(equalTo: dayTextField.bottomAnchor, constant: 8).isActive = true
        timeFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        timeFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        timeFieldView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func contactAddFieldViewLayout() {
        contactAddFieldView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contactAddFieldView)
        
        contactAddFieldView.topAnchor.constraint(equalTo: timeFieldView.bottomAnchor, constant: 8).isActive = true
        contactAddFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        contactAddFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        contactAddFieldView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func customButtonViewLayout() {
        customButtonLblView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(customButtonLblView)
        
        customButtonLblView.topAnchor.constraint(equalTo: contactAddFieldView.bottomAnchor, constant: 16).isActive = true
        customButtonLblView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        customButtonLblView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        customButtonLblView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    }
}

extension AddDoctorView : UITextFieldDelegate {
    enum textFields:Int {case fNameTag = 0, lNameTag, emailTag, phoneNumberTag, categoryTag, dayTag, timeTag, contactTag }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print ("textField should begin editing method called")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch (textField.tag) {
        case 0:
            fNameTextFieldVal = textField.text
        case 1:
            lNameTextFieldVal = textField.text
        case 2:
            emailAddTextFieldVal = textField.text
        case 3:
            phoneNumTextFieldVal = textField.text
        case 4:
            categoryNumTextFieldVal = textField.text
        case 5:
            dayTextFieldVal = textField.text
        case 6:
            timeFieldViewVal = textField.text
            
        default:
            print ("No text field tag")
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



