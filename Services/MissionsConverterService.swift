//
//  MissionsConverterService.swift
//  GreenFoot
//
//  Created by Arya Gharib on 4/12/22.
//  Copyright © 2022 Sina Gharib. All rights reserved.
//

import Foundation

struct MissionsConverterService {
    
    //Convert raw name into prettier name
    static func convertMissionsString(_ toConvert: String) -> String {
        switch toConvert {
        case "Offset Shopping":
            return "Reduce Shopping to the Essentials"
        default:
            return toConvert
        }
    }
}
