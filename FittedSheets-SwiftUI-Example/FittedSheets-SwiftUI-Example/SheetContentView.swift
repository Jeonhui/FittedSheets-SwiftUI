//
//  SheetContentView.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/16/24.
//

import SwiftUI
import FittedSheets
import FittedSheetsSwiftUI

struct SheetContentView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Sheet Content View")
            HStack {
                Spacer()
            }
            .frame(height: 0)
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(4)
        .padding(8)
    }
}
