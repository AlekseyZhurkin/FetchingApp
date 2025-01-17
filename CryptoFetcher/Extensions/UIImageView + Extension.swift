//
//  UIImageView + Extension.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 16.01.2025.
//

import UIKit

// MARK: - Style
extension UIImageView {
    func setImageStyle() {
        layer.borderWidth = 1
        layer.cornerRadius = frame.width / 2
        layer.borderColor = CGColor(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.1
        )
    }
}
