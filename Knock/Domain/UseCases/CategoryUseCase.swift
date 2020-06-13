//
//  CategoryUseCase.swift
//  Knock
//
//  Created by Christopher Grayston on 6/11/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation

protocol CategoryUseCaseProtocol {
    func addNewCategory(categoryName: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)

    func removeCategory(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    
    func updateCategoryValue(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    
    func getSelectedDayCategories(date: Date, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    //func refreshRooms(completion: @escaping ((Result<Void, Error>) -> Void))
}

class CategoryUseCase: CategoryUseCaseProtocol {
    
    func addNewCategory(categoryName: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO
    }
    
    func removeCategory(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO
    }
    
    func updateCategoryValue(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO
    }
    
    func getSelectedDayCategories(date: Date, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO 
    }
}
