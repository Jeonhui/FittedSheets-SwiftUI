//
//  ExampleView.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/16/24.
//

import SwiftUI
import FittedSheets
import FittedSheetsSwiftUI

struct ExampleView: View {
    @State var showFittedSheet: Bool = false
    
    private let sheetSize: SheetSize

    init(_ sheetSize: SheetSize) {
        self.sheetSize = sheetSize
    }
    
    var body: some View {
        VStack {
            Button {
                showFittedSheet.toggle()
            } label: {
                Text("show sheet")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("\(self.sheetSize)")
    }
}
