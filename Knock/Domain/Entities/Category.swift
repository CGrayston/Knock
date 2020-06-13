//
//  Category.swift
//  Knock
//
//  Created by Christopher Grayston on 6/11/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation
import ObjectMapper

struct Category: Mappable {
    var uid: String?
    var name: String?
    var count: Int?
    
    init?(map: Map) {
        uid <- map["uid"]
        name <- map["name"]
        count <- map["count"]
    }
    
    mutating func mapping(map: Map) {
        /// Mapping already completed in init()
    }
}
