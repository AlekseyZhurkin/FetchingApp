//
//  InfoViewController.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 15.01.2025.
//

import UIKit

final class InfoViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var symbolNameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var high24Label: UILabel!
    @IBOutlet weak var low24Label: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var changePercentLabel: UILabel!
    
    // MARK: - Public Properties
    var symbol: Symbol!
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
        showInfo(for: symbol)
    }
}

// MARK: - Private Methods
private extension InfoViewController {
    func showInfo(for symbol: Symbol) {
        symbolNameLabel.text = symbol.name
        symbolLabel.text =  symbol.symbol.uppercased()
        rankLabel.text = "#" + String(symbol.marketCapRank)

        priceLabel.text = symbol.currentPrice >= 1 ?
            "$" + String(format: "%.02f", symbol.currentPrice) :
            "$" + String(format: "%.05f", symbol.currentPrice)
        
        marketCapLabel.text = "$" +
            String(format: "%.02f", symbol.marketCap / 1000000000) + "B"
        
        high24Label.text = symbol.currentPrice >= 1 ?
            "$" + String(format: "%.02f", symbol.priceHigh) :
            "$" + String(format: "%.05f", symbol.priceHigh)
        
        low24Label.text = symbol.currentPrice >= 1 ?
            "$" + String(format: "%.02f", symbol.priceLow) :
            "$" + String(format: "%.05f", symbol.priceLow)
        
        changeLabel.text = symbol.currentPrice >= 1 ?
            "$" + String(format: "%.02f", symbol.priceChange) :
            "$" + String(format: "%.05f", symbol.priceChange)
        
        changePercentLabel.text = symbol.currentPrice >= 1 ? 
            String(format: "%.02f", symbol.pricePercentage) + "%" :
            String(format: "%.05f", symbol.pricePercentage) + "%"
    }
    
    func getImage() {
        networkManager.fetchImage(from: symbol.imageURL) { [unowned self] result in
            switch result {
            case .success(let imageData):
                imageView.image = UIImage(data: imageData)
                imageView.setImageStyle()
            case .failure(let error):
                print(error)
            }
        }
    }
}
