//
//  CompeteUserFinderService.swift
//  GreenFoot
//
//  Created by Arya Gharib on 11/2/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import Firebase

struct CompeteUserFinderService {
    static func findCompetitors(contains letters: String?, completion: @escaping ([String]) -> Void) {
        guard let letters = letters else { return }
        var usernames = [String]()
        let ref = Database.database().reference().child("usernames")
        ref.keepSynced(true)
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let value = Array((snapshot.value as! [String: Any]).keys)
//            usernames = value.map { $0.lowercased() }.filter { $0.contains(letters.lowercased()) }
            usernames = value.filter{ $0.contains(letters.lowercased()) || $0.contains(letters) }
            print(value)
            print(usernames)
            completion(usernames)
        }
        
    }
    
    static func getData(_ usernames: [String], completion: @escaping ([String: Int]) -> Void) {
        guard !usernames.isEmpty else { return }
        
        var userDataList = [String: Int]()
        
        for user in usernames {
            getUserData(user) { (userData) in
                userDataList.merge(userData) { (current, _) in current }
                completion(userDataList)
            }
        }
        
        
        
//        for user in usernames {
//            print(ref.child(user))
//
//        }
        
    }
    
    static func getUserData(_ username: String,  completion: @escaping ([String: Int]) -> Void) {
        let ref = Database.database().reference().child("usernames")
        var userData = [String: Int]()
        
        //Get the data for this user
        ref.child(username).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as! [String: Any]
            guard (value["shareData"] as! Bool) else { return }
            userData[username] = (value["stars"] as! Int)
            
            completion(userData)
            
        }
    }
}
