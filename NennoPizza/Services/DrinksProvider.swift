//
//  DrinksProvider.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import Foundation

final class DrinksProvider: Provider {
    typealias Result = [Drink]
    
    var baseUrl: String = "https://api.myjson.com/bins/150da7"
    
    let apiService = ApiService()
    var result: [Drink] = []
}
