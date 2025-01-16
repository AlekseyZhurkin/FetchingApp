//
//  Symbol.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 11.01.2025.
//

import Foundation

struct Symbol: Decodable {
    // MARK: - Public Properties
    let symbol: String
    let name: String
    let imageURL: URL
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int
    let priceHigh: Double
    let priceLow: Double
    let priceChange: Double
    let pricePercentage: Double
    
    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case name = "name"
        case imageURL = "image"
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case priceHigh = "high_24h"
        case priceLow = "low_24h"
        case priceChange = "price_change_24h"
        case pricePercentage = "price_change_percentage_24h"
    }
}


