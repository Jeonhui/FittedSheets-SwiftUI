//
//  SimpleSettingExampleView.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/19/24.
//

import SwiftUI
import FittedSheetsSwiftUI

struct SimpleSettingExampleView: View {
    // MARK: - Sheet State Variable
    @State var showFittedSheet: Bool = false
    
    var body: some View {
        VStack {
            // MARK: - Show Sheet Action
            Button {
                showFittedSheet.toggle()
            } label: {
                Text("show sheet")
            }
        }
        .navigationTitle("Simple")
        .navigationBarTitleDisplayMode(.inline)
        // MARK: - Append Fitted Sheet
        .fittedSheet(isPresented: $showFittedSheet,
                     sizes: [.intrinsic, .marginFromTop(100)],
                     sheetView: {
            // MARK: - Sheet Content View
            SheetContentView()
        })
    }
}

