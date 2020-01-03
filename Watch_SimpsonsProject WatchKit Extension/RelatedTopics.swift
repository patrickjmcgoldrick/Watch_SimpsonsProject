//
//  RelatedTopics.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class RelatedTopics: Decodable {
    var relatedTopics: [Cast]?
    
    private enum CodingKeys : String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

