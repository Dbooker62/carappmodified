//
//  Models.swift
//  CarApp
//
//  Created by student on 2/9/24.
//

import Foundation
// Feature.swift
class Car {
    var color: String?
    var tires: String?
    var engine: String?
    var interior: String?
    var navigation : String?
   
}

struct Feature {
    let name: String
    let options: [String]
}
