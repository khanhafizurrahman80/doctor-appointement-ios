//
//  CustomError.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 26/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import Foundation

enum CustomError: LocalizedError {
    case dataNotFound
    case responseError
    case invalidData
    case dataNotParsed
    case invalidJson
    
    var localizedDescription: String? {
        switch self {
        case .dataNotFound:
            return "Data not found!"
        case .responseError:
            return "Invalid response!"
        case .invalidData:
            return "Invalid data!"
        case .dataNotParsed:
            return "Data could not be parsed!"
        case .invalidJson:
            return "Invalid json format!"
        }
    }
}
