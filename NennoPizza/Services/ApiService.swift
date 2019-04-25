//
//  ApiService.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import Foundation

typealias ResponceCompletion = (Data?, Error?)->Void

final class ApiService {
    
    @discardableResult
    func getRequest(url: URL, completion: ResponceCompletion? = nil) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                DispatchQueue.main.async {
                    completion?(nil, error)
                }
                return
            }
            DispatchQueue.main.async {
                completion?(dataResponse, error)
            }
        }
        task.resume()
        return task
    }
}
