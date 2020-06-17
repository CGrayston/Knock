//
//  SplashViewController.swift
//  Knockk
//
//  Created by Chris Grayston on 6/6/20.
//  Copyright © 2020 Chris Grayston. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import ObjectMapper

class SplashViewController: UIViewController {
    
    // Properties
    let dispatchGroup = DispatchGroup()
    var ref: DatabaseReference!
    
    // Data Injection
    var userResponse: UserResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Constants.Colors.vivintOrange

        ref = Database.database().reference()

        if Auth.auth().currentUser != nil {
            // User is signed in
            
            // Fetch data
            getFirebaseData()
            
            // Set tabBar as root view controller
            dispatchGroup.notify(queue: .main) {
                let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as? TabBarViewController
                tabBarVC?.userResponse = self.userResponse
                self.view.window?.rootViewController = tabBarVC
                self.view.window?.makeKeyAndVisible()
            }
        } else {
            // No user is signed in. Set login screen as root view controller
            DispatchQueue.main.async {
                let homePageVC = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginViewController
                
                self.view.window?.rootViewController = homePageVC
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    func getFirebaseData() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        dispatchGroup.enter()
        self.ref.child("users").child(currentUser.uid).observe(DataEventType.value) { (snapshot) in
            self.userResponse = Mapper<UserResponse>().map(JSONObject: snapshot.value)
            self.dispatchGroup.leave()
        }
    }
}


