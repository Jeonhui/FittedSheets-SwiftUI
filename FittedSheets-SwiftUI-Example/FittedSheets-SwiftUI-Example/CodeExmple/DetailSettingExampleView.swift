//
//  DetailSettingExampleView.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/19/24.
//

import SwiftUI
import FittedSheetsSwiftUI

struct DetailSettingExampleView: View {
    // MARK: - Sheet State Variable
    @State var showFittedSheet: Bool = false
    
    // MARK: - Configure Detail FittedSheets Settings
    let sheetConfiguration: SheetConfiguration = SheetConfiguration(sizes: [.intrinsic,
                                                                            .marginFromTop(100)],
                                                                    options: .init(pullBarHeight: 40),
                                                                    sheetViewControllerOptinos: [],
                                                                    shouldDismiss: nil,
                                                                    didDismiss: nil)
    var body: some View {
        VStack {
            // MARK: - Show Sheet Action
            Button {
                showFittedSheet.toggle()
            } label: {
                Text("show sheet")
            }
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        // MARK: - Append Fitted Sheet
        .fittedSheet(isPresented: $showFittedSheet,
                     configuration: sheetConfiguration) {
            // MARK: - Sheet Content View
            SheetContentView()
        }
    }
}
