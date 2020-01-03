//
//  Cast.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class Cast: Decodable {
    var result: String?
    var text: String
    var icon: Icon?
    var firstUrl: String?
    
    private enum CodingKeys : String, CodingKey {
        case result = "Result"
        case text = "Text"
        case icon = "Icon"
        case firstUrl = "FirstUrl"
    }
}
