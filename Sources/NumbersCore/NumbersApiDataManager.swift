//
//  NumbersApiDataManager.swift
//
//
//  Created by Ivan Solohub on 27.05.2024.
//

import Foundation

public class NumbersApiDataManager {
    
    public init() {}
    
    public func fetchFact(for request: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: request) else {
            completion(.failure(NSError(domain: "InvalidURL", code: 1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data, let factString = String(data: data, encoding: .utf8) {
                completion(.success(factString))
            } else {
                completion(.failure(NSError(domain: "DataDecodingError", code: 2, userInfo: nil)))
            }
        }
        task.resume()
    }
}
