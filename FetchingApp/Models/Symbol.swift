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
    let image: URL
    let current_price: Double
    let market_cap: Int
    let market_cap_rank: Int
    let high_24h: Double
    let low_24h: Double
    let price_change_24h: Double
    let price_change_percentage_24h: Double
}
