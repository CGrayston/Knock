//
//  WorkDay.swift
//  Knock
//
//  Created by Christopher Grayston on 6/14/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation
import ObjectMapper

struct WorkDayResponse: Mappable {
    var dateUID: String?
   
    var workCategories: [String]?
    var resultCategories: [String]?
    
    var timeWorked: Int?
    var isWorkDay: Bool?
    var date: Date?
    
    var userUID: String?
    
    init?(map: Map) {
        dateUID <- map["dateUID"]
        workCategories <- map["workCategories"]
        resultCategories <- map["resultCategories"]
        timeWorked <- map["timeWorked"]
        isWorkDay <- map["isWorkDay"]
        date <- map["date"]
        userUID <- map["userUID"]
    }
    
    mutating func mapping(map: Map) {
        /// Mapping already completed in init()
    }
}
