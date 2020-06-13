//
//  Dynamic.swift
//  Knock
//
//  Created by Christopher Grayston on 6/11/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation

// sources: https://medium.com/@azamsharp/mvvm-in-ios-from-net-perspective-580eb7f4f129
class Dynamic<T> {

    var bind :(T) -> () = { _ in }

    var value :T? {
        didSet {
            bind(value!)
        }
    }

    init(_ v :T) {
        value = v
    }
}
