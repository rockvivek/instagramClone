//
//  DatabadeManagement.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager{
    public static var shared = DatabaseManager()
    
    //database reference
    let database = Database.database().reference()
    
    //public
    
    ///check if username or email id is already exist in database or not
    /// Parameters
    ///     email for email id
    ///     username for username
    public func checkIfUserEmailExist(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    ///create new user in the database
    /// Parameters
    ///     email for email id
    ///     username for username
    ///     completion for callback with if successed or not
    public func insertNewUser(with email:String, username:String, completion: @escaping (Bool) -> Void ){
        database.child(email.safeDatabaseKey()).setValue(["username": username]){ error, _ in
            if error == nil {
                //insert success
                completion(true)
                return
            }
            else{
                //insert failed
                print(error?.localizedDescription)
                completion(false)
                return
            }
        }
    }
    
}
