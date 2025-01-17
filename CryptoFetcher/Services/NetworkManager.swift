//
//  NetworkManager.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 15.01.2025.
//

import Foundation

enum Link {
    case api
    
    var url: URL {
        switch self {
        case .api:
            URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    // MARK: - Public Properties
    static let shared = NetworkManager()
    
    // MARK: - Initializers
    private init() {}
        
    // MARK: - Public Methods
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error ?? "No error description")
                completion(.failure(.noData))
                return
            }
            
            do {
                let dataModel = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
