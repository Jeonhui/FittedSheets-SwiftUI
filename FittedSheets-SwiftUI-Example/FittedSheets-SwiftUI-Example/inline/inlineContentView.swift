//
//  inlineContentView.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/16/24.
//

import SwiftUI
import FittedSheets
import FittedSheetsSwiftUI

struct InlineContentView: View {
    @State var showInlineSheetView: Bool = false
    
    let sheetConfiguration: SheetConfiguration = SheetConfiguration(
        sizes: [.intrinsic, .percent(0.3), .fullscreen],
        options: SheetOptions(
            useInlineMode: true
        ),
        sheetViewControllerOptinos: [],
        shouldDismiss: nil,
        didDismiss: nil)
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Spacer()
                HStack{
                    Spacer()
                    Button {
                        showInlineSheetView.toggle()
                    } label: {
                        Text("Inline Mode Sheet Test")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
            }
            .fittedSheet(isPresented: $showInlineSheetView,
                         configuration: sheetConfiguration) {
                VStack {
                    Text("Inline Mode Testing")
                }
            }
                         .background(.blue)
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 40)
        .background(.black)
    }
}

#Preview {
    InlineContentView()
}
