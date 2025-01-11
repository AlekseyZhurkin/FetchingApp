//
//  ViewController.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 11.01.2025.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMarketCap()
    }
}

// MARK: - Networking
extension ViewController {
    private func fetchMarketCap() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do{
                let symbols = try JSONDecoder().decode([Symbol].self, from: data)
                print(symbols)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
