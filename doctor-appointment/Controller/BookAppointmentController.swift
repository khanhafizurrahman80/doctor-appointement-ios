//
//  BookAppointmentController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 28/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class BookAppointmentController: UIViewController {
    
    var bookAppView = BookAppView(frame: .zero)
    var doctorFullName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [bookAppView].forEach{self.view.addSubview($0)}
        layout()
        datePickerAction()
        targetFunctions()
    }
    
    private func layout() {
        bookAppView.anchors(top: self.view.safeAreaLayoutGuide.topAnchor,
                            leading: self.view.safeAreaLayoutGuide.leadingAnchor,
                            bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                            trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                            size: .init(width: 0, height: 0))
    }
    
    private func targetFunctions() {
        calendarTargetFunction()
        sendButtonTargetFunction()
    }
    
    private func calendarTargetFunction() {
        bookAppView.backButton.addAction(for: .touchUpInside) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func sendButtonTargetFunction() {
        bookAppView.sendButton.addAction(for: .touchUpInside) {
            let appointment = AppointmentBook(appointmentTakenBy: "a1" ?? "",
                                                  appointmentTakenTo: self.doctorFullName ?? "",
                                                  appointmentAddress: "c1" ?? "",
                                                  appointmentTime: "d1" ?? "",
                                                  approved: true)
            self.makeData(with: appointment)
        }
    }
    
    private func makeData(with appointment: AppointmentBook) {
        do {
            guard let jsonData = try? JSONEncoder().encode(appointment) else {
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
            try NetworkHelper.shared.sendData(url: "http://localhost:8080/appointment-controller/add-appointment",
                                              json: json,
                                              onSuccess: handle(successString:),
                                              onFailure: handle(error:))
        }catch {
            print (error.localizedDescription)
        }
    }
    
    private func handle(successString: String) {
        print (successString)
    }
    
    private func handle(error: Error) {
        print (error)
    }
    
    private func datePickerAction() {
        bookAppView.datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        bookAppView.dateselectedLabel.text = DateFormatter.localizedString(from: bookAppView.datePicker.date,
                                                                           dateStyle: DateFormatter.Style.full,
                                                                           timeStyle: DateFormatter.Style.short)
    }
}

extension BookAppointmentController: IndividualDocViewControllerDelegate {
    func passDocSummary(with doctorSummary: DoctorSummary) {
        self.doctorFullName = doctorSummary.fullName
        print (self.doctorFullName)
    }
}
