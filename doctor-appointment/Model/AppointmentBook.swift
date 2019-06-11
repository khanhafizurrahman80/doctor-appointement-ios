//
//  AppointmentBook.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 29/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import Foundation

struct AppointmentBook: Codable {
    var appointmentTakenBy : String?
    var appointmentTakenTo : String
    var appointmentAddress : String
    var appointmentTime : String
    var approved : Bool
}
