//
//  DIPSUseCase.swift
//  Knock
//
//  Created by Christopher Grayston on 6/7/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation

protocol DIPSUseCaseProtocol {
    func createNewCategory(categoryName: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    
//    func
    
    func refreshRooms(completion: @escaping ((Result<Void, Error>) -> Void))
    
}

class DIPSUseCase {
    
//    private let 
}
