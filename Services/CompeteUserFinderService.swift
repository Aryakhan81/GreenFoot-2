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
    func find(contains letters: String) -> [String?] {
        var usernames: [String?] = [nil]
        let ref = Database.database().reference().child("usernames")
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as! [String]
            usernames = value.map { $0.lowercased() }.filter { $0.contains(letters.lowercased()) }
        }
        
        return usernames
    }
}
