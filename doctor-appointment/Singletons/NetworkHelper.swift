//
//  NetworkHelper.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 25/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import Alamofire

typealias ErrorClosure = (Error) -> Void
typealias StringClosure = (String) -> Void
typealias DataClosure = (Data) -> Void

class NetworkHelper {
    static let shared = NetworkHelper()
    private init() {}
    
    func fetchData(url: String,
                   onSuccess: @escaping DataClosure,
                   onFailure: @escaping ErrorClosure) {
        Alamofire.request(url).responseJSON { response in
            if let error = response.error {
                onFailure(error)
                return
            }
            if let resultError = response.result.error {
                onFailure(resultError)
                return
            }
            guard let data = response.data else {
                onFailure(CustomError.invalidData)
                return
            }
            onSuccess(data)
        }
    }
    
    func sendData(url: String,
                  json: Any,
                  onSuccess: @escaping StringClosure,
                  onFailure: @escaping ErrorClosure) throws {
        
        guard let params = json as? Parameters else {
            throw CustomError.invalidJson
        }
        
        Alamofire.request(url,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default).responseString { response in
                            if let error = response.error {
                                onFailure(error)
                                return
                            }
                            if let resultError = response.result.error {
                                onFailure(resultError)
                                return
                            }
                            if let value = response.result.value {
                                onSuccess(value)
                                return
                            }
                            onFailure(CustomError.dataNotFound)
        }
    }
}
