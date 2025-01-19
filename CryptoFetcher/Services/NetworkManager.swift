//
//  NetworkManager.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 15.01.2025.
//

import Foundation
import Alamofire

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
    
    func fetchImage(from url: String, completion: @escaping (Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func fetch(from url: String, completion: @escaping (Result<[Symbol], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let symbols = Symbol.getRandomSymbols(from: value)
                    completion(.success(symbols))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
