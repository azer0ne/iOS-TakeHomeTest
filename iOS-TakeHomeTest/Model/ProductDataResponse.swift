//
//  ProductDataResponse.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 08/01/24.
//

import Foundation

struct ProductDataResponse: Codable {
    let code: Int
    let message, error: String
    let data: [ProductData]
    let totalData: Int
    
    struct ProductData: Codable {
        let code: String
        let name: String
        let details: Details
    }
    
    struct Details: Codable {
        let category: String
        let categoryID: Int
        let currency: String
        let custody: String
        let inceptionDate: String
        let imAvatar: String
        let imName: String
        let minBalance: Int
        let minRedemption: Int
        let minSubscription: Int
        let nav: Double
        let returnCurYear: Double
        let returnFiveYear: Double
        let returnFourYear: Double
        let returnInceptionGrowth: Double
        let returnOneDay: Double
        let returnOneMonth: Double
        let returnOneWeek: Double
        let returnOneYear: Double
        let returnSixMonth: Double
        let returnThreeMonth: Double
        let returnThreeYear: Double
        let returnTwoYear: Double
        let totalUnit: Int
        let type: String
        let typeID: Int
        
    }
}
