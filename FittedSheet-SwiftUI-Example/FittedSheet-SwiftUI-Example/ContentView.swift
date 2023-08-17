//
//  ContentView.swift
//  FittedSheet-SwiftUI-Example
//
//  Created by 이전희 on 2023/08/17.
//

import SwiftUI
import FittedSheetsSwiftUI

struct ContentView: View {
    @State var showFittedSheet: Bool = false
    let sheetConfiguration: SheetConfiguration = SheetConfiguration(
        sizes: [.percent(0.5)],
        options: nil,
        sheetViewControllerOptinos: [],
        shouldDismiss: nil,
        didDismiss: nil)
    
    var body: some View {
        VStack {
            Button {
                showFittedSheet.toggle()
            } label: {
                Text("open sheet")
            }
        }
        .fittedSheet(isPresented: $showFittedSheet,
                     configuration: sheetConfiguration) {
            Text("opened")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
