//
//  Icon.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class Icon: Decodable {
    var url: String?
    var width: String?
    var height: String?
    
    private enum CodingKeys : String, CodingKey {
        case url = "URL"
        case width = "Width"
        case height = "Height"
    }
}

