//
//  UIImageView + Extension.swift
//  FetchingApp
//
//  Created by Алексей Журкин on 16.01.2025.
//

import UIKit

// MARK: - Style
extension UITableViewCell {
    func setImageStyle(image: UIImageView) {
        setImageStyleMain(image: image)
    }
}

// MARK: - Style
extension UIViewController {
    func setImageStyle(image: UIImageView) {
        setImageStyleMain(image: image)
    }
}

func setImageStyleMain(image: UIImageView) {
    image.layer.borderWidth = 1
    image.layer.cornerRadius = image.frame.width / 2
    image.layer.borderColor = CGColor(
        red: 0,
        green: 0,
        blue: 0,
        alpha: 0.1
    )
}
