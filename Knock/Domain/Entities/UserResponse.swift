//
//  UserResponse.swift
//  Knock
//
//  Created by Christopher Grayston on 6/16/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

struct UserResponse: Mappable {
    var uid: String?
    var imageId: String = ""
    var email: String?
    var createdAt: Date?
    var signedIn: Date?
    var workDays: [String : Any]?
    
    init?(map: Map) {
        uid <- map["uid"]
        imageId <- map["imageId"]
        email <- map["email"]
        createdAt <- (map["createdAt"], DateUTCTransform())
        signedIn <- (map["signedIn"], DateUTCTransform())
        workDays <- map["workDays"]
    }
    
    mutating func mapping(map: Map) {
        /// Mapping already completed in init()
    }
}
