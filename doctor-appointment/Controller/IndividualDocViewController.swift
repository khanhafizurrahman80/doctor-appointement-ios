//
//  IndividualDocViewController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 27/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

protocol IndividualDocViewControllerDelegate {
    func passDocSummary(with doctorSummary :  DoctorSummary)
}

class IndividualDocViewController: UIViewController {

    var doc_id : Int64 = 0
    var doctor : DoctorTestFetch?
    var doctorSummary : DoctorSummary?
    var indDocDetails = IndividualDocDetails(frame: .zero)
    var delegate: IndividualDocViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(indDocDetails)
        self.navigationController?.isNavigationBarHidden = true
        layout()
        addBackTargetFunc()
        fetchData()
        bookAppointmentTargetFunc()
        // Do any additional setup after loading the view.
    }
    
    private func layout() {
        indDocDetails.anchors(top: self.view.safeAreaLayoutGuide.topAnchor,
                              leading: self.view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                              trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                              size: .init(width: 0, height: 0))
    }
    
    private func bookAppointmentTargetFunc() {
        indDocDetails.bookAppButton.addAction(for: .touchUpInside) {
            self.navigationController?.pushViewController(BookAppointmentController(), animated: true)
            self.delegate?.passDocSummary(with: self.doctorSummary ?? DoctorSummary(docId: -1, fullName: " ", category: " "))
        }
    }
    private func addBackTargetFunc() {
        indDocDetails.backButton.addAction(for: .touchUpInside) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func fetchData() {
        let url = "http://localhost:8080/doctor/get-individual-desc/\(doc_id)"
        NetworkHelper.shared.fetchData(url: url,
                                       onSuccess: dataDidFetch(data:),
                                       onFailure: handle(error:))
    }
    
    private func dataDidFetch(data: Data) {
        do{
            doctor = try PayloadParser.shared.getParsedData(data: data, type: DoctorTestFetch.self)
            createDoctorSummary()
            updateLabelInfo()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    private func createFullName (withFName firstName : String, withLName lastName: String) -> String {
        let firstName = firstName
        let lastName = lastName
        let fullName = firstName + " " + lastName
        return fullName
    }
    
    private func createDoctorSummary() {
        let fullName = createFullName(withFName: doctor?.firstName ?? " ", withLName: doctor?.lastName ?? " ")
        doctorSummary = DoctorSummary(docId: doctor?.id ?? -1,
                                      fullName: fullName,
                                      category: doctor?.category ?? "")
    }
    
    private func handle(error: Error) {
        print(error.localizedDescription)
    }
    
    private func updateLabelInfo() {
        let fullName = createFullName(withFName: doctor?.firstName ?? " ", withLName: doctor?.lastName ?? " ")
        let emailAddress = doctor?.emailAddress ?? " "
        let phoneNumber = doctor?.phoneNumber ?? " "
        let catgory = doctor?.category ?? " "
        var appointmentTime = ""
        var address = ""
        for doctorTime in doctor?.doctorDetails ?? [DoctorDetailsTestFetch(id: -1, day: " ", time: " ", contactAddress: " ")] {
            let dtime = "\(doctorTime.day ?? " ") \(doctorTime.time ?? " ")\n"
            appointmentTime.append(dtime)
            address = doctorTime.contactAddress ?? ""
        }
        let labelText = "\(fullName) \n\(emailAddress) \n\(phoneNumber) \n\(catgory) \n\(address) \nAppointment Time: \n\(appointmentTime)"
        indDocDetails.docdesclabel.text = labelText
    }

}
