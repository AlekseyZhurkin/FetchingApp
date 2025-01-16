//
//  SymbolCell.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 15.01.2025.
//

import UIKit

final class SymbolCell: UITableViewCell {
    // MARK: - IB Outlets
    @IBOutlet var symbolImage: UIImageView!
    @IBOutlet var symbolNameLabel: UILabel!
    @IBOutlet var symbolPriceLabel: UILabel!
    @IBOutlet var marketCapRankLabel: UILabel!
    @IBOutlet var pricePercentLabel: UILabel!
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager.shared
}

// MARK: - Cell Configuration
extension SymbolCell {
    func configure(with symbol: Symbol) {
        marketCapRankLabel.text = "# \(symbol.marketCapRank)"
        symbolNameLabel.text = symbol.name
        symbolPriceLabel.text = symbol.currentPrice >= 1 ?
            "$" + String(format: "%.02f", symbol.currentPrice) :
            "$" + String(format: "%.05f", symbol.currentPrice)
        pricePercentLabel.text = symbol.currentPrice >= 1 ? 
            String(format: "%.02f", symbol.pricePercentage) + "%" :
            String(format: "%.05f", symbol.pricePercentage) + "%"
        
        networkManager.fetchImage(from: symbol.imageURL) { [unowned self] result in
            switch result {
            case .success(let imageData):
                symbolImage.image = UIImage(data: imageData)
                setImageStyle(image: symbolImage)
            case .failure(let error):
                print(error)
            }
        }
    }
}

