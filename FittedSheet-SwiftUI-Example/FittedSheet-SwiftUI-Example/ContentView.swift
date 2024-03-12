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
        sizes: [.fullscreen],
        options: nil,
        sheetViewControllerOptinos: [],
        shouldDismiss: nil,
        didDismiss: nil)
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    InlineContentView()
                } label: {
                    Text("Inline Mode Test")
                }

                Button {
                    showFittedSheet.toggle()
                } label: {
                    Text("sheet button")
                }
            }
        }
        .fittedSheet(isPresented: $showFittedSheet,
                     configuration: sheetConfiguration) {
            Text("new Sheets")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
