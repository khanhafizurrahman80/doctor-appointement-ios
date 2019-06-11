//
//  AddDoctorViewController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 26/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class AddDoctorViewController: UIViewController {

    var addDoctorView = AddDoctorView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ADD Doctor"
        addDoctorView.delegate = self
        layout()
    }
    
    func layout() {
        addDoctorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addDoctorView)
        
        addDoctorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        addDoctorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        addDoctorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        addDoctorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension AddDoctorViewController: AddDoctorViewDelegate {
    func makeData(with doctor: Doctor) {
        do {
            guard let jsonData = try? JSONEncoder().encode(doctor) else {
                throw CustomError.invalidJson
            }
            guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
                throw CustomError.invalidData
            }
            sendData(with: json)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func sendData(with json: Any) {
        do {
            try NetworkHelper.shared.sendData(url: "http://localhost:8080/doctor/add-doctor",
                                              json: json,
                                              onSuccess: handle(successString:),
                                              onFailure: handle(error:))
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func handle(successString: String) {
        print(successString)
    }
    
    private func handle(error: Error) {
        print(error.localizedDescription)
    }
}
