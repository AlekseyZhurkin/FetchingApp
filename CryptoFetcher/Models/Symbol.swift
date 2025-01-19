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
    let imageURL: String
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int
    let priceHigh: Double
    let priceLow: Double
    let priceChange: Double
    let pricePercentage: Double
    
    // MARK: - Initializers
    init(symbolDetails: [String: Any]) {
        symbol = symbolDetails["symbol"] as? String ?? ""
        name = symbolDetails["name"] as? String ?? ""
        imageURL = symbolDetails["image"] as? String ?? ""
        currentPrice = symbolDetails["current_price"] as? Double ?? 0
        marketCap = symbolDetails["market_cap"] as? Double ?? 0
        marketCapRank = symbolDetails["market_cap_rank"] as? Int ?? 0
        priceHigh = symbolDetails["high_24h"] as? Double ?? 0
        priceLow = symbolDetails["low_24h"] as? Double ?? 0
        priceChange = symbolDetails["price_change_24h"] as? Double ?? 0
        pricePercentage = symbolDetails["price_change_percentage_24h"] as? Double ?? 0
    }
    
    // MARK: - Public Methods
    static func getRandomSymbols(from value: Any) -> [Symbol] {
        guard let symbolDetails = value as? [[String: Any]] else { return [] }
        return symbolDetails.map { Symbol(symbolDetails: $0) }
    }
}
