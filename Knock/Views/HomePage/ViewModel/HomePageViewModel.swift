//
//  HomePageViewModel.swift
//  Knock
//
//  Created by Christopher Grayston on 6/11/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//
import Foundation

protocol HomePageViewModelProtocol {
    var categories: Dynamic<[String]> { get }
    var error: Dynamic<String> { get }
    
    func nextDate()
    func previousDate()
    func newCategory(name: String)
    func deleteCategory(name: String, uid: String)
}

class HomePageViewModel: HomePageViewModelProtocol {
    
    // MARK: - Dependencies
    let selectedDateUseCase: SelectedDateUseCase
    let workDayUseCase: WorkDayUseCase
    
    // MARK: - Properties
    // TODO
    //var workCells: Dynamic<[Category]>
    //var categoryCells: Dynamic<[Category]>
    
    var categories: Dynamic<[String]>
    var error: Dynamic<String>
    
    // MARK: - Init
    init(selectedDateUseCase: SelectedDateUseCase, workDayUseCase: WorkDayUseCase) {
        self.selectedDateUseCase = selectedDateUseCase
        self.workDayUseCase = workDayUseCase
        
        // TODO change category type to get it's value from
        
        
        self.categories = Dynamic([String]()) // c.loadcategories
        self.error = Dynamic("")
        
        fetchWorkDay()

        // TODO
        //self.workCells =
    }
    
    // MARK: - Helper Methods
    func fetchWorkDay() {
        workDayUseCase.getOrCreateSelectedWorkDay(date: Date()) { (result) in
            switch result {
            case .success(let workDay):
                // TODO save workday/(workCells,categoryCells)
                print("TODO save", workDay)
            case .failure(let error):
                // TODO Send alert with error
                print("TODO error", error)
            }
        }
    }
    
    // MARK: - Methods
    func nextDate() {
        // TODO - Get data for next selected date --> Change categories to this information
        categories.value?.append("Something")
    }
    
    func previousDate() {
        // TODO - Get data for previous selected date
    }
    
    func newCategory(name: String) {
        // TODO
    }
    
    func deleteCategory(name: String, uid: String) {
        // TODO
    }
}
