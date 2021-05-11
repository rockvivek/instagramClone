//
//  AuthManager.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    public static var shared = AuthManager()
    
    //public
    public func register(username:String, email:String, password:String, completion: @escaping (Bool) -> Void){
        /* check username exist
            check email exist */
        DatabaseManager.shared.checkIfUserEmailExist(with: email, username: username) { canCreate in
            if canCreate {
                /* create account
                    insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                    guard authResult != nil, error == nil else {
                        //Firebaseauth could not create account
                        print(error?.localizedDescription)
                        completion(false)
                        return
                    }
                    //user inserted
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            //good to go
                            completion(true)
                        }
                        else {
                            //insertion failed
                            completion(false)
                        }
                    }
                    
                })
            }
            else{
                //either username or email does exist
                completion(false)
            }
        }
    }
    
    public func login(username:String?, email:String?, password:String, completion: @escaping (Bool) -> Void){
        if let email = email{
            Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            })
        }
        if let username = username {
            print(username)
        }
        
    }
    
    ///logout from the current login session
    public func logout(completion: (Bool) -> Void) {
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
        
    }
}
