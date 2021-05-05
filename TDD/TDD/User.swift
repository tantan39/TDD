//
//  User.swift
//  TDD
//
//  Created by Tan Tan on 5/4/21.
//

import Foundation

struct User {
    var products = Set<String>()
    
    mutating func buy(_ product: String) {
        products.insert(product)
    }
    
    func owns(_ product: String) -> Bool {
        return products.contains(product)
    }
}
