//
//  Store.swift
//  Koupgon
//
//  Created by Mobile on 2017-01-18.
//  Copyright © 2017 genozhou. All rights reserved.
//

import Foundation

struct Store {
    let id: String
    let name: String
    let distance: String
    let imageURL: URL
    
    init(id: String, name: String, distance: String, imageURL: URL) {
        self.id = id
        self.name = name
        self.distance = distance
        self.imageURL = imageURL
    }
}
