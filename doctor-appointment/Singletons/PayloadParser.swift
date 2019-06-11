//
//  PayloadParser.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 26/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import Foundation

class PayloadParser {
    static let shared = PayloadParser()
    private init() {}
    
    func getParsedData<T: Codable>(data: Data?, type: T.Type) throws -> T {
        guard let data = data else {
            throw CustomError.dataNotParsed
        }
        return try JSONDecoder().decode(type, from: data)
    }
}
