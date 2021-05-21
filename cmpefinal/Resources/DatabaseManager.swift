//
//  DatabaseManager.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/18/21.
//

import Foundation
import  FirebaseDatabase

final class DatabaseManager{
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //    public func test(){
    //
    //        database.child("foo").setValue(["something":true])
    //    }
}

extension DatabaseManager{
    
    public func validateNewUserExists(with email:String, completion: @escaping((Bool)->Void)){
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else{
                completion(false)
                return
            }
            
            completion(true)
            
        })
    }
    
    
    
    //insert new user to database
    public func insertUser(with user:MemoOLUser){
        
        database.child(user.safeEmail).setValue([
            "first_name":user.firstName,
            "last_name":user.lastName
        ])
        
    }
}


struct MemoOLUser {
    let firstName: String
    let lastName: String
    let emailID: String
    
    var safeEmail:String{
        var safeEmail = emailID.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
    //let ProfilePictureURL: String
}
