//
//  ClosureSleeve.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 28/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import Foundation

class ClosureSleeve {
    let Voidclosure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.Voidclosure = closure
    }
    
    @objc func invoke () {
        Voidclosure()
    }
}


