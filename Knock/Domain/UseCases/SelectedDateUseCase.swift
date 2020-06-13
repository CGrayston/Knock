//
//  HomePageUseCase.swift
//  Knock
//
//  Created by Christopher Grayston on 6/7/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation

protocol SelectedDateUseCaseProtocol {
    func createNewCategory(categoryName: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    
    func nextDay()
    
    func previousDay()
    
    func loadSelectedDay()
    
    //func refreshRooms(completion: @escaping ((Result<Void, Error>) -> Void))
    
}

class SelectedDateUseCase: SelectedDateUseCaseProtocol {
    func createNewCategory(categoryName: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO
    }
    
    func nextDay() {
        // TODO
    }
    
    func previousDay() {
        // TODO
    }
    
    func loadSelectedDay() {
        // TODO
    }
}
