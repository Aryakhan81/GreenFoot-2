//
//  User.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/23/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import FirebaseDatabase

class User: Codable {
    
    // User properties...
    let uid: String
    let username: String
    var carbonFootprint: String?
    var carbonReduced: String?
    var stars: String?
    var missions = [String: Double]()
    
    private static var _current: User?
    
    static var current: User {
        guard let currentUser = _current else {
            fatalError("Error: current user does not exist")
        }
        return currentUser
    }
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any], let username = dict["username"] as? String else { return nil }
        self.uid = snapshot.key
        self.username = username

    }
    
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = true) {
        if writeToUserDefaults {
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: "currentUser")
            }
        }
        _current = user
    }
}
