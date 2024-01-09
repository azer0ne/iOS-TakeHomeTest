//
//  APIEndpoint.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 09/01/24.
//

import Foundation

enum APIEndpoint {
    
    case productDetail
    case charts

    var baseURL: URL {
        let url = URL(string: "https://cb9dbfce-c5f3-4539-85ad-fa23da9713b0.mock.pstmn.io/takehometest/apps/compare/")!
        let baseURL = url.appendingPathComponent(path)
        return baseURL
    }
    
    var path: String {
        switch self {
        case .productDetail:
            return "detail"
        case .charts:
            return "chart"
        }
    }
    
    var query: [URLQueryItem]? {
        let queryItem = urlComponents.queryItems
        return queryItem
    }

    var urlComponents: URLComponents {
        guard var components =  URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            fatalError("Failed to create URLComponents")
        }
        
        components.queryItems = [
            URLQueryItem(name: "productCodes", value: "KI002MMCDANCAS00"),
            URLQueryItem(name: "productCodes", value: "TP002EQCEQTCRS00"),
            URLQueryItem(name: "productCodes", value: "NI002EQCDANSIE0")
        ]
        
        return components
    }

}
