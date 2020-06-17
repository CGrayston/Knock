//
//  WorkDayUseCase.swift
//  Knock
//
//  Created by Christopher Grayston on 6/11/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation

protocol WorkDayUseCaseProtocol {
    func addNewCategory(categoryName: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)

    func removeCategory(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    
    func updateCategoryValue(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void)
    
    func getOrCreateSelectedWorkDay(date: Date, completion: @escaping ((Result<WorkDayResponse, Error>) -> Void))
    //func refreshRooms(completion: @escaping ((Result<Void, Error>) -> Void))
}

class WorkDayUseCase: WorkDayUseCaseProtocol {
    
    // MARK: - Properties
    private let workDayRepository: WorkDayRepository
    
    var userResponse: UserResponse
    var workDay: WorkDayResponse?
    
    // MARK: - Initilization
    init(workDayRepository: WorkDayRepository, user: UserResponse, workDay: WorkDayResponse?) {
        self.workDayRepository = workDayRepository
        self.userResponse = user
        self.workDay = workDay
    }
    
    // MARK: - Methods
    func addNewCategory(categoryName: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO
    }
    
    func removeCategory(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO
    }
    
    func updateCategoryValue(categoryUID: String, success: @escaping () -> Void, failure: @escaping (NSError) -> Void) {
        // TODO
    }
    
    func getOrCreateSelectedWorkDay(date: Date, completion: @escaping ((Result<WorkDayResponse, Error>) -> Void)) {
        // if workDay is nil then we create emptyWorkDay
        if workDay == nil {
            workDayRepository.createWorkDay(date: date) { (result) in
                switch result {
                case .success(let workDay):
                    completion(.success(workDay))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

enum TODOError: Error {
    case TODO
}
