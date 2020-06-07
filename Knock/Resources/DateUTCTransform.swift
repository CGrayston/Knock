//
//  DateUTCTransform.swift
//  Knock
//
//  Created by Christopher Grayston on 6/6/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation
import ObjectMapper

open class DateUTCTransform: TransformType {
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> Date? {
        if let timeStr = value as? String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")!
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            
            if let date = dateFormatter.date(from: timeStr) {
                return date
            }
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: Date?) -> String? {
        return nil
    }
}
