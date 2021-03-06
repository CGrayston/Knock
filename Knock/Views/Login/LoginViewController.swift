//
//  LoginViewController.swift
//  Knockk
//
//  Created by Chris Grayston on 1/17/20.
//  Copyright © 2020 Chris Grayston. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import ObjectMapper

class LoginViewController: UIViewController {
    
    let dispatchGroup = DispatchGroup()
    var ref: DatabaseReference!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Set the presenting view controller of the GIDSignIn object
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        ref = Database.database().reference()
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("Failed to sign in with error: ", error)
            return
        }
        
        // Get good auth credential
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // Sign in
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Failed to sign in with error: ", error)
                return
            }
            
            // User is signed in
            guard let currentUser = authResult?.user,
                let isNewUser = authResult?.additionalUserInfo?.isNewUser else {
                    fatalError("no userUID, will have to redo this unwrapping")
            }
            
            // User is signed in.
            if isNewUser {
                // First login
                guard let imageId = currentUser.photoURL?.absoluteString,
                    let email = currentUser.email,
                    let createdAt = currentUser.metadata.creationDate?.transformToJSON(),
                    let signedIn = currentUser.metadata.lastSignInDate?.transformToJSON() else {
                        return
                }
                
                // Create new user entry in Firebase
                self.dispatchGroup.enter()
                self.ref.child("users").child(currentUser.uid).setValue([
                    "uid": currentUser.uid,
                    "imageId": imageId,
                    "email": email,
                    "createdAt": createdAt,
                    "signedIn": signedIn,
                ])
                self.dispatchGroup.leave()
                
                // Create
            } else {
                // Not first login code goes here

            }
            
            self.dispatchGroup.enter()
            self.ref.child("users").child(currentUser.uid).observe(DataEventType.value) { (snapshot) in
                self.user = Mapper<User>().map(JSONObject: snapshot.value)
                self.dispatchGroup.leave()
            }
            
            self.dispatchGroup.notify(queue: .main) {
                let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as? TabBarViewController
                tabBarVC?.user = self.user
                self.view.window?.rootViewController = tabBarVC
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
    }
}
