//
//  DoctorTestFetch.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 28/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import Foundation

struct DoctorTestFetch: Codable {
    var id: Int64?
    var firstName: String?
    var lastName: String?
    var emailAddress: String?
    var phoneNumber: String?
    var category: String?
    var doctorDetails: [DoctorDetailsTestFetch]?
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int64 ?? -1
//        firstName = json["firstName"] as? String ?? ""
//        lastName = json["lastName"] as? String ?? ""
//        emailAddress = json["emailAddress"] as? String ?? ""
//        phoneNumber = json["phoneNumber"] as? String ?? ""
//        category = json["category"] as? String ?? ""
//        doctorDetails = json["doctorDetails"] as? String ??
//    }
}
