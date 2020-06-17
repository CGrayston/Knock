//
//  DIPSRepository.swift
//  Knock
//
//  Created by Christopher Grayston on 6/7/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation
import Firebase

protocol WorkDayRepositoryProtocol {
    func getWorkDay(completion: @escaping ((Result<WorkDayResponse, Error>) -> Void))
    
    func updateWorkDay(roomName: String, roomId: String, devicesMacs: [String], completion: @escaping ((Result<WorkDayResponse, Error>) -> Void))
    
    func createWorkDay(date: Date, completion: @escaping ((Result<WorkDayResponse, Error>) -> Void))
}

class WorkDayRepository: WorkDayRepositoryProtocol {
    
//    var ref: DatabaseReference!
//
//    init(ref: DatabaseReference!) {
//        self.ref = Database.database().reference()
//    }
    
    // MARK: - Protocol Methods
    func getWorkDay(completion: @escaping ((Result<WorkDayResponse, Error>) -> Void)) {
        // TODO
    }
    
    func updateWorkDay(roomName: String, roomId: String, devicesMacs: [String], completion: @escaping ((Result<WorkDayResponse, Error>) -> Void)) {
        // TODO
    }
    
    func createWorkDay(date: Date, completion: @escaping ((Result<WorkDayResponse, Error>) -> Void)) {
        // TODO - figure this out
        
        
        // Check User's workDays array to see if we have a template to go off of
        guard let userUID = Auth.auth().currentUser?.uid else {
            return
        }
        
        FirebaseManager.sharedInstance.getUserWorkDays(userUID: userUID) { [weak self] (result) in
            let workDays: [String : Bool]? = result
            if let workDayTemplate = workDays?.first {
                // If there is workDays in User -> Create a new one with template
                
                // Get workday using the workDayUID
                
            } else {
                // Else if there are no workDays in User -> Create new workDay with empty arrays
                self?.createNewBlankWorkDay {
                    
                }
            }
        }
    }
    
    // MARK: - Helper Methods

    func createNewWorkDayWithTemplate(workDayUID: String) {
        // Create new user entry in Firebase
        let workDayUID = UUID().uuidString

    }
    
    func createNewBlankWorkDay(success: @escaping () -> Void) {
        // Create new user entry in Firebase
        let workDayUID = UUID().uuidString
        
        
        
    }
}
