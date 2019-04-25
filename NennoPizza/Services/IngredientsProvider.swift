//
//  IngredientsProvider.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import Foundation

final class IngredientsProvider: Provider {
    typealias Result = [Ingredient]
    
    var baseUrl: String = "https://api.myjson.com/bins/ozt3z"
    
    let apiService = ApiService()
    var result: [Ingredient] = []
}
