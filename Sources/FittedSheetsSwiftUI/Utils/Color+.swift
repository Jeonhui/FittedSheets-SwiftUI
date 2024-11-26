//
//  Color+.swift
//  
//
//  Created by 이전희 on 2023/08/17.
//

import SwiftUI

public extension Color {
    func uiColor() -> UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }
        
        let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255
        }
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
