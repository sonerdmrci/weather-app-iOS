//
//  UIColor+Ext.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit


extension UIColor {
    static func hex(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var sanitizedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        sanitizedHex = sanitizedHex.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: sanitizedHex).scanHexInt64(&rgb) else {
            return UIColor.black // Varsayılan bir renk döndürebilirsiniz
        }

        return UIColor(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
