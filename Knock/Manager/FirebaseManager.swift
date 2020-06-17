//
//  FirebaseManager.swift
//  Knock
//
//  Created by Christopher Grayston on 6/16/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import Foundation
import Firebase
import ObjectMapper

class FirebaseManager {
    
    // MARK: - Singleton
    static let sharedInstance = FirebaseManager()
    
    var ref: DatabaseReference!
    //var userUID: String?
    
    init() {
        self.ref = Database.database().reference()
        //self.userUID = Auth.auth().currentUser?.uid
    }
    
    func createNewUser(uid: String, imageId: String, email: String, createdAt: String, signedIn: String, success: @escaping () -> Void) {
        self.ref.child("users").child(uid).setValue([
            "uid": uid,
            "imageId": imageId,
            "email": email,
            "createdAt": createdAt,
            "signedIn": signedIn
        ])
        success()
    }
    
    func createNewWorkDay(dateUID: String, imageId: String, email: String, createdAt: String, signedIn: String, success: @escaping () -> Void) {
        self.ref.child("users").child(dateUID).setValue([
            "dateUID": dateUID,
            "workCategory": imageId,
            "email": email,
            "createdAt": createdAt,
            "signedIn": signedIn
        ])
        success()
    }
    
    func getUser(userUID: String, completion: @escaping (Result<UserResponse?, Error>) -> Void) {
        self.ref.child("users").child(userUID).observeSingleEvent(of: .value, with: { (snapshot) in
            let userResponse = Mapper<UserResponse>().map(JSONObject: snapshot.value)
            completion(.success(userResponse))
        })
    }
    
    func getUserWorkDays(userUID: String, success: @escaping ([String : Bool]?) -> Void) {
        ref.child("users").child(userUID).observeSingleEvent(of: .value) { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let workDays = value?["workDays"] as? [String : Bool]
            success(workDays)
        }
    }
}
