//
//  SecondInlineContentView.swift
//  FittedSheet-SwiftUI-Example
//
//  Created by 이전희 on 3/13/24.
//

import SwiftUI
import FittedSheets
import FittedSheetsSwiftUI

struct SecondInlineContentView: View {
    @State var showSheet: Bool = false
    let sheetConfiguration: SheetConfiguration = .init(sizes: [.intrinsic, .fullscreen], options: .init(useInlineMode: true))
    
    let values: [Int] = Array(Range(0...100))
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                showSheet.toggle()
            } label: {
                Text("toggle")
            }
            VStack {
                HStack{Spacer()}
                List(values, id: \.self) { value in
                    Text("\(value)")
                }
            }
            .fittedSheet(isPresented: $showSheet,
                         configuration: sheetConfiguration) {
                Text("asdfhasdflkahsdflkadshflkasdhfl")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
