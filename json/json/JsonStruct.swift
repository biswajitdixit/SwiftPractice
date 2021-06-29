//
//  JsonStruct.swift
//  json
//
//  Created by admin on 05/05/21.
//

import Foundation
struct JsonStruct:Decodable {
    let name:String
    let capital:String
    let alpha3Code:String
    let alpha2Code:String
    let region:String
    let subregion:String
}
