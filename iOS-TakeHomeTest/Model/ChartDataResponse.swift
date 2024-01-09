//
//  ChartDataResponse.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 08/01/24.
//

import Foundation

struct ChartDataResponse: Codable {
    let code: Int
    let message: String
    let error: String
    let data: [ChartDataModel]
    let totalData: Int
}

struct ChartDataModel: Codable {
    let data: [ChartData]
    let error: String
}

struct ChartData: Codable {
    let date: String
    let value: Double
    let growth: Double
    
}
