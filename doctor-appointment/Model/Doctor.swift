//
//  Doctor.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 26/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import Foundation

struct Doctor: Codable {
    var firstName: String
    var lastName: String
    var emailAddress: String
    var phoneNumber: String
    var category: String
    var doctorDetails: [DoctorDetails]
}
