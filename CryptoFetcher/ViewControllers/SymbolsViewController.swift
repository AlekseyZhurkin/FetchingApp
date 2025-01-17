//
//  ViewController.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 11.01.2025.
//

import UIKit

final class SymbolsViewController: UITableViewController {
    // MARK: - Private Properties
    private var symbols: [Symbol] = []
    private let networkManager = NetworkManager.shared
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchMarketCap()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoVC = segue.destination as? InfoViewController
        infoVC?.symbol = sender as? Symbol
    }
}

// MARK: - Networking
extension SymbolsViewController {
    private func fetchMarketCap() {
        networkManager.fetch([Symbol].self, from: Link.api.url) { [unowned self] result in
            switch result {
            case .success(let symbols):
                self.symbols = symbols
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension SymbolsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        symbols.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "symbolCell", for: indexPath)
        guard let cell = cell as? SymbolCell else { return UITableViewCell() }
        
        let symbol = symbols[indexPath.row]
        cell.configure(with: symbol)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let symbol = symbols[indexPath.row]
        performSegue(withIdentifier: "showInfo", sender: symbol)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
