//
//  DIPSRepository.swift
//  Knock
//
//  Created by Christopher Grayston on 6/7/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation

protocol DIPSRepositoryProtocol {
    func getTodaysDIPS(success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    
   // func update
}

class DIPSRepository {
    
}
