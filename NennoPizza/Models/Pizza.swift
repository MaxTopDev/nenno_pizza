//
//  Pizza.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import Foundation

struct PizzaList: Codable {
    var pizzas: [Pizza]
    var basePrice: Double
}

struct Pizza: Codable {
    var name: String
    var ingredients: [Int]
    var imageUrl: String?
}
