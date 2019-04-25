//
//  PizzaProvider.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import Foundation

final class PizzaProvider: Provider {
    typealias Result = PizzaList
    
    var baseUrl: String = "https://api.myjson.com/bins/dokm7"
    
    let apiService = ApiService()
    var result: PizzaList = PizzaList(pizzas: [], basePrice: 0)
}
