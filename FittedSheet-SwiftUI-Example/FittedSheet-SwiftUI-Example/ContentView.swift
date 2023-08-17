//
//  ContentView.swift
//  FittedSheet-SwiftUI-Example
//
//  Created by 이전희 on 2023/08/17.
//

import SwiftUI
import FitttedSheets_SwiftUI

struct ContentView: View {
    @State var showFittedSheet: Bool = false
    
    var body: some View {
        VStack {
            Button {
                showFittedSheet.toggle()
            } label: {
                Text("open sheet")
            }
        }
        .fittedSheet(isPresented: $showFittedSheet) {
            Text("opened")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
