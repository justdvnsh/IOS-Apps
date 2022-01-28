//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Divyansh Dwivedi on 28/01/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let q: String
    let a: String
    
    init(q: String, a: String) {
        self.q = q
        self.a = a
    }
}
