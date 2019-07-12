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
    static func findCompetitors(contains letters: String?) -> [String] {
        guard let letters = letters else { return [] }
        var usernames = [String]()
        let ref = Database.database().reference().child("usernames")
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let value = Array((snapshot.value as! [String: Any]).keys)
            usernames = value.map { $0.lowercased() }.filter { $0.contains(letters.lowercased()) }
            print(value)
            print(usernames)
        }
        
        return usernames
    }
    
    static func getData(_ usernames: [String]) -> [String: Any] {
        guard !usernames.isEmpty else { return [:] }
        
        var userData = [String: Any]()
        let ref = Database.database().reference().child("usernames")
        for user in usernames {
            ref.child(user).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as! [String: Any]
                guard (value["shareData"] as! Bool) else { return }
                userData[user] = value["stars"]
            }
        }
        
        return userData
    }
}
