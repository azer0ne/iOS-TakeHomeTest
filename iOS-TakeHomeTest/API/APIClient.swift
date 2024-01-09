//
//  APIClient.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 09/01/24.
//

import Foundation

class ApiClient {
    
    func getData(endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = endpoint.urlComponents.url else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
