//
//  Protocols.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import Foundation

protocol Provider: class {
    associatedtype Result: Codable
    
    var baseUrl: String { get }
    var apiService: ApiService { get }
    
    var result: Result { get set }
    
    func fetch(completion: @escaping (Result?, Error?) -> Void)
}

extension Provider {
    func fetch(completion: @escaping (Result?, Error?) -> Void) {
        let url = URL(string: baseUrl)!
        apiService.getRequest(url: url) { [weak self] (data, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Result.self, from: data)
                self?.result = result
                completion(result, error)
            } catch let parsingError {
                completion(nil, parsingError)
            }
        }
    }
}
