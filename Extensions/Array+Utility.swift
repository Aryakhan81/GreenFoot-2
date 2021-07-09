//
//  Array+Utiliity.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/9/21.
//  Copyright © 2021 Sina Gharib. All rights reserved.
//

import Foundation

extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}
