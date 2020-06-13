//
//  HomePageViewModel.swift
//  Knock
//
//  Created by Christopher Grayston on 6/11/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

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
    //let homePageUseCase: HomePageUseCase
    //let categoryUseCase: CategoryUseCase
    
    var categories: Dynamic<[String]>
    var error: Dynamic<String>
    
    // MARK: - Init
    init() {
        //self.homePageUseCase = homePageUseCase
        //self.categoryUseCase = categoryUseCase
        self.categories = Dynamic([String]())
        self.error = Dynamic("")
    }
    
    
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
