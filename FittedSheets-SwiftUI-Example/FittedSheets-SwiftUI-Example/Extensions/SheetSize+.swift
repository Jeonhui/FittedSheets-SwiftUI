//
//  SheetSize+.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/16/24.
//

import FittedSheets

extension SheetSize: Identifiable,
                     Hashable,
                     CaseIterable,
                     CustomStringConvertible {
    
    public var id: String { self.description }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.description)
    }
    
    // Default Case
    public static var allCases: [FittedSheets.SheetSize] {
        [.intrinsic, .fixed(300), .fullscreen, .percent(0.3), .marginFromTop(100)]
    }
    
    public var description: String {
        switch self {
        case .intrinsic: "intrinsic"
        case .fixed(let value): "fixed(\(value))"
        case .fullscreen: "fullscreen"
        case .percent(let value): "percent(\(value))"
        case .marginFromTop(let value): "marginFromTop(\(value))"
        }
    }
}
